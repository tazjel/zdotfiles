# Custom Authentication Class
# Implementation similar to gluon.tools

from gluon.html import URL
from gluon.http import redirect
import hashlib

class CustomAuthentication(object):
    """ Role-Based authentication module """

    def __init__(self, environment, db):
        self.request = environment['request']
        self.response = environment['response']
        self.session = environment['session']
        self.cache = environment['cache']
        self.T = environment['T']
        self.db = db
        self._anonymous_user = 'Anonymous User'
        self.environment = environment

    def __call__(self):
        """ Returns the username """
        _auth_name = self.session.auth_alias
        if _auth_name is None:
            _auth_name = self._anonymous_user
        return _auth_name

    def authenticate(self, auth_alias, auth_passwd):
        """ sets authentication for the user """
        auth = False
        self.logout() # Clear up previous session if any
        hash_pwd = hashlib.sha1('%s%s' % (auth_alias, auth_passwd)).hexdigest()
        rows = self.db((self.db.auth_users.auth_alias==auth_alias) &
            (self.db.auth_users.auth_passwd==hash_pwd) &
            (self.db.auth_users.is_enabled==True)).select()
        if rows:
            self.session.auth_alias = auth_alias
            self.session.user_id = rows[0].id
            auth = True
        return auth

    def authenticate_janrain(self, identifier, name, email, profile_pic_url):
        """ Authenticates against JANRAIN, formerly RPX, an authentication
        provider, see http://janrain.com/ for more information

        """
        # Note if this method is called, most likely the user
        # has been authenticated by the external source (janrain)
        # So all is left to be done is to add the user to our user DB
        # if he/she does not exist, and (*or*, if the user does indeed already
        # exist) update the user's metadata...
        # (name, email)
        # In addition, I am not (currently doing anything with profile_pic_url
        # or identifier but they might come in handy later.
        self.logout() # Clear up previous session if any
        user = self.db(
            (self.db.auth_users.auth_alias==email) &
            (self.db.auth_users.is_enabled==True)).select().first()
        if user is None:
            # User does not exist, create it
            # This password is fake, not used for anything really...
            hash_passwd = hashlib.sha1('%s%s' % (name, identifier)).hexdigest()
            # New User - add it with the default role of Member
            # NOTE: THIS ROLE MUST EXIST
            auth_role_id = self.db(
                self.db.auth_roles.role_name=='Member').select(
                    self.db.auth_roles.id)[0].id
            auth_user_id = self.db.auth_users.insert(
                auth_alias=email,
                auth_passwd=hash_passwd,
                auth_created_on=self.request.now,
                auth_modified_on=self.request.now,
                is_enabled=True,
                auth_role_id=auth_role_id)
            # If user is not None, it means that it exists already,
            # shall we update the password with another (meaningless) hash
            # Probably not, just get his/her info though.
            user = self.db(
                (self.db.auth_users.auth_alias==email) &
                (self.db.auth_users.is_enabled==True)).select().first()
        user_id = user.id # Convenience
        self.__id = user_id
        self.session.auth_alias = email
        self.session.user_id = user_id
        return user_id

    def authenticate_google(self, auth_alias, auth_passwd):
        """ Provides a simple method for authentication in google
        using web2py's internal methods

        """
        # If the user logs in and there is already an account for him/her,
        # update the password only, If ther user does not exist, then insert it
        # with the appropriate credentials.
        # IMPORTANT: For google accounts, the "auth_alias" parameter will come
        # in as "user@gmail.com", or "user@googlehosteddomain.com", it is
        # important to do the following:
        # db.auth_users.auth_alias will contain the value of auth_alias
        # db.member_properties_skel.m_display_name will contain auth_alias
        # *without* the domain name
        user_exists = False
        self.logout() # Clear up previous session if any
        auth_alias_no_domain = auth_alias[:auth_alias.find('@')]
        # When logged in with a google account, do not store the user's password
        # instead, create a temporary, random password and store it in the DB
        # if this DB ever gets stolen for any reason, no google account passwords
        # would be compromised
        # hash_passwd = hashlib.sha1('%s%s' % (auth_alias,
        #               auth_passwd)).hexdigest()
        hash_passwd = hashlib.sha1('%s%s' % (auth_alias,
                                             hashlib.sha1().hexdigest(
                                                 ))).hexdigest()
        if self.db(self.db.auth_users.auth_alias.lower()==\
                   auth_alias.lower()).count():
            self.__id = self.db(self.db.auth_users.auth_alias==auth_alias
                                ).select(self.db.auth_users.id)[0].id
            # User already exists, update passwd only
            # May not be needed
            self.db(self.db.auth_users.auth_alias==auth_alias
                    ).update(auth_passwd=hash_passwd)
            user_exists = True
        else:
            # New User - add it with the default role of Member
            # NOTE: THIS ROLE MUST EXIST
            auth_role_id = self.db(self.db.auth_roles.role_name=='Member'
                                   ).select(self.db.auth_roles.id)[0].id
            auth_user_id = self.db.auth_users.insert(
                auth_alias=auth_alias,
                auth_passwd=hash_passwd,
                auth_created_on=self.request.now,
                auth_modified_on=self.request.now,
                is_enabled=True,
                auth_role_id=auth_role_id)
            self.__id = auth_user_id
        self.session.auth_alias = auth_alias
        self.session.user_id = auth_user_id
        # REMEMBER: If flow of program hits this method, the user is already
        # correctly authenticated
        return user_exists

    def logout(self):
        """ Clear the session """
        self.session.auth_alias = None
        self.session.user_id = None

    def has_role(self, roles):
        """ Receives a comma-separated string containing the roles to check and
        will return True if the user contains any of the passed roles

        """
        hasrole = False
        # web2py's "belong()" method uses a tuple as parameter
        roles_to_check = tuple(roles.split(','))
        if self.is_auth():
            auth_id = self.get_user_id()
            # select
            #   ar.role_name
            # from
            #   auth_users as au,
            #   auth_roles as ar
            # where
            #   au.auth_role_id = ar.id
            #   and ar.role_name in (%(roles_to_check))
            #   and au.id = %(auth_id)s
            tstrole = self.db((self.db.auth_users.id==auth_id) &\
                (self.db.auth_users.auth_role_id == self.db.auth_roles.id) &\
                (self.db.auth_roles.role_name.belongs(roles_to_check))).count()
            hasrole = tstrole > 0
        return hasrole

    def get_role(self):
        """ Returns a string containing the role the user belongs to """
        role_name = None
        if self.is_auth():
            auth_alias = self.get_user_name()
            try:
                role_name = self.db((self.db.auth_users.auth_role_id ==\
                                     self.db.auth_roles.id) &\
                    (self.db.auth_users.auth_alias == auth_alias)).select(
                        self.db.auth_roles.role_name)[0].role_name
            except IndexError, TypeError:
                pass
        return role_name

    def get_user_name(self):
        """ same as __call__ - returns the username (alias) """
        #_auth_name = self.session.auth_alias
        #if _auth_name is None:
        #    _auth_name = self._anonymous_user
        #return _auth_name
        return self._anonymous_user\
               if self.session.auth_alias is None else self.session.auth_alias

    def get_user_id(self):
        """ Returns the user's "id" database field """
        return self.session.user_id

    def is_auth(self):
        """ True if the user has been authenticated in the system,
        false otherwise

        """
        return self.session.auth_alias is not None

    def is_admin(self):
        """ This is a hack-y method (or shortcut) that can become useful
        in the future if the developer decides that "SysAdmin" should not
        be the only "admin" in the system

        """
        return self.has_role('SysAdmin') # Add "more" as needed

    def requires_login(self):
        """ Decorator Helper to aid in determine whether a controller
        needs specific access

        """
        def wrapper(func):

            def f(*args, **kwargs):
                if not self.is_auth():
                    return redirect(URL(r=self.request, c='members', f='login',
                                        vars=dict(err='needlogin')))
                return func(*args, **kwargs)

            return f

        return wrapper

    def requires_role(self, roles):
        """ Decorator Helper to aid in determine whether a controller
        needs specific access

        """
        def wrapper(func):

            def f(*args, **kwargs):
                if not self.has_role(roles):
                    return redirect(URL(r=self.request, c='members', f='login',
                                        vars=dict(err='needrole')))
                return func(*args, **kwargs)

            return f

        return wrapper
