# Custom methods used by the system in order to try to have them all
# isolated in one module, instead of being scattered around all the
# controllers.
import base64
import struct
import smtplib
import random
import hashlib
import math

from cStringIO import StringIO

from gluon.html import URL


class QAStackHelper(object):
    """ Provides methods to deal with qa-stack's miscellaneous
    functions.

    """

    def __init__(self, environment, db, auth_user):
        self.request = environment['request']
        self.response = environment['response']
        self.session = environment['session']
        self.cache = environment['cache']
        self.T = environment['T']
        self.db = db
        self.auth_user = auth_user
        self.environment = environment

    def get_system_property(self, property_name, default_value):
        """ Checks for a possible system property and returns its associated
        value if the property exists and its value is empty, it does also
        return the default value """
        prop = self.db(self.db.system_properties.property_name == property_name\
            ).select(self.db.system_properties.id,
                     self.db.system_properties.property_desc,
                     self.db.system_properties.property_value)
        if prop:
            property_value = prop[0].property_value
        else:
            property_value = default_value
        return property_value

    def get_system_properties(self):
        """ Returns all of QA-Stack's system properties """
        return self.db().select(self.db.system_properties.ALL)

    def put_system_property(self, property_name, new_value):
        """ UPDATES an existing property name if it does indeed
        exist, "new value" must always be a string,
        it returns a boolean value describing success in adding the property
        or failure when the prioperty could not be updated """
        if self.auth_user.is_admin(): # <-- May not be needed
            prop = self.db(self.db.system_properties.property_name==\
                           property_name).select(self.db.system_properties.id)
            if prop:
                prop_id = prop[0].id
                self.db(self.db.system_properties.id==prop_id
                        ).update(property_value=new_value)
                updated = True
            else:
                updated = False
        else:
            updated = False
        return updated

    def get_member_property(self, property_name, auth_user, default_value):
        """ Similar to get_system_property() but will handle member properties
        instead of system properties.
        Note: auth_user is the ID id the user, not the email or other parameter

        """
        user_property_value = default_value
        # First check if the property exists
        property_check = self.db(
            self.db.member_properties_skel.property_name==\
            property_name).select(self.db.member_properties_skel.id)
        if property_check:
            property_id = property_check[0].id
            user_prop = self.db(
                (self.db.member_properties.property_id==property_id) & \
                (self.db.member_properties.auth_user==self.db.auth_users.id) & \
                (self.db.auth_users.id==auth_user)
                ).select(self.db.member_properties.property_value)
            if user_prop:
                user_property_value = user_prop[0].property_value
        return user_property_value

    def put_member_property(self, property_name, auth_user_id, new_value):
        # auth_user must be the ID of the user returned by
        # auth_user.get_user_id() or similar
        errors = {'errors': ''}
        # Check if the property exists
        property_check = \
                       self.db(self.db.member_properties_skel.property_name ==\
                               property_name).select(
                                   self.db.member_properties_skel.id,
                                   self.db.member_properties_skel.member_editable)
        if property_check:
            property_id = property_check[0].id
            #member_editable = property_check[0].member_editable
            # Does this property exists for the user?
            prop_exists = self.db(
                (self.db.member_properties.property_id == property_id) & \
                (self.db.member_properties.auth_user==auth_user_id)
                ).count() > 0
            if prop_exists:
                # Yes, then update
                self.db(
                    (self.db.member_properties.property_id==property_id) & \
                    (self.db.member_properties.auth_user==auth_user_id)
                    ).update(property_value=new_value)
            else:
                # Nope, Create
                self.db.member_properties.insert(
                    auth_user=auth_user_id,
                    property_id=property_id,
                    property_value=new_value)
        else:
            errors.update({'errors': 'Member property name not found'})
        return errors

    def increment_member_property(self, property_name, user_id, add_value):
        # Since QA-Stack has several member properties that are values
        # that usually need to be incremented (or decremented), this
        # stub method was created for this reason
        new_val = int(self.get_member_property(property_name,
                                           user_id,
                                           0)) + add_value
        self.put_member_property(property_name, user_id, new_val)

    def has_member_avatar(self, auth_user_id, bypass=True):
        """ Tests if there is an avatar stored for the user,
        if bypass is True, it'll check for the avatar active flag """
        if bypass:
            avatar_info = self.db(
                (self.db.member_avatars.auth_user_id==auth_user_id) & \
                (self.db.member_avatars.avatar_active==True)
                ).select(
                self.db.member_avatars.content_type,
                self.db.member_avatars.avatar_image)
        else:
            avatar_info = self.db(
                self.db.member_avatars.auth_user_id==\
                self.db.member_avatars.auth_user_id
                ).select(
                self.db.member_avatars.content_type,
                self.db.member_avatars.avatar_image)
        if avatar_info:
            return True
        else:
            return False

    def has_question_subscription(self, question_id, user_id):
        has_s = self.db((self.db.question_subscriptions.auth_user_id==user_id) &\
                        (self.db.question_subscriptions.question_id==\
                         question_id)).count() > 0
        return has_s

    def add_question_subscription(self, question_id, user_id):
        # Add subscription only if it does not exist the subscription already
        # in the table, if the subscription already exists, just "enable" it,
        # otherwise create a new record
        if self.has_question_subscription(question_id, user_id):
            self.db((self.db.question_subscriptions.auth_user_id==user_id) &\
                    (self.db.question_subscriptions.question_id==question_id)
                    ).update(is_active=True)
        else:
            # Does not exist, add
            self.db.question_subscriptions.insert(auth_user_id=user_id,
                                                  question_id=question_id,
                                                  is_active=True)

    def del_question_subscription(self, questions, user_id):
        # "questions" might be a single (string) element, or a list
        # this is due to the multiple="multiple" nature of the <select>
        # container, so make the duck quack here somehow..
        try:
            questions.sort()
        except AttributeError:
            questions = [questions]

        self.db(
            (self.db.question_subscriptions.auth_user_id==user_id) &\
            (self.db.question_subscriptions.question_id.belongs(
                [int(x) for x in questions]))).update(is_active=False)

    def user_is_subscribed(self, question_id, user_id):
        # Returns True if the user has a subscription and it is a valid
        # (Enabled one), otherwise False
        # TODO
        is_subscribed =\
        self.db((self.db.question_subscriptions.auth_user_id==user_id) &\
                (self.db.question_subscriptions.question_id==question_id) &\
                (self.db.question_subscriptions.is_active==True)).count() > 0
        return is_subscribed


    def get_inappropriate_questions_cnt(self):
        return self.db(self.db.questions.offensive_cnt > 0).count()

    def get_admin_msgs_cnt(self):
        return self.db(self.db.admin_messages.read_flag==False).count()

    def get_image_info(self, data):
        data = str(data)
        size = len(data)
        height = -1
        width = -1
        content_type = ''

        # handle GIFs
        if (size >= 10) and data[:6] in ('GIF87a', 'GIF89a'):
            # Check to see if content_type is correct
            content_type = 'image/gif'
            w, h = struct.unpack("<HH", data[6:10])
            width = int(w)
            height = int(h)

        # See PNG v1.2 spec (http://www.cdrom.com/pub/png/spec/)
        # Bytes 0-7 are below, 4-byte chunk length, then 'IHDR'
        # and finally the 4-byte width, height
        elif ((size >= 24) and (data[:8] == '\211PNG\r\n\032\n') and\
              (data[12:16] == 'IHDR')):
            content_type = 'image/png'
            w, h = struct.unpack(">LL", data[16:24])
            width = int(w)
            height = int(h)

        # Maybe this is for an older PNG version.
        elif (size >= 16) and (data[:8] == '\211PNG\r\n\032\n'):
            # Check to see if we have the right content type
            content_type = 'image/png'
            w, h = struct.unpack(">LL", data[8:16])
            width = int(w)
            height = int(h)

        elif (size >= 2) and (data[:2] == '\377\330'):
            content_type = 'image/jpeg'
            jpeg = StringIO(data)
            jpeg.read(2)
            b = jpeg.read(1)
            try:
                while (b and ord(b) != 0xDA):
                    while (ord(b) != 0xFF):
                        b = jpeg.read(1)
                    while (ord(b) == 0xFF):
                        b = jpeg.read(1)
                    if (ord(b) >= 0xC0 and ord(b) <= 0xC3):
                        jpeg.read(3)
                        h, w = struct.unpack(">HH", jpeg.read(4))
                        break
                    else:
                        jpeg.read(int(struct.unpack(">H", jpeg.read(2))[0])-2)
                    b = jpeg.read(1)
                width = int(w)
                height = int(h)
            except:
                pass

        return content_type, width, height


    def emailpwd(self, req_email):
        admin_email = self.get_system_property('s_admin_contact_email', '')
        mailserver = self.get_system_property('s_mailserver', '')
        username = self.get_system_property('s_mailserver_username', '')
        passwd = self.get_system_property('s_mailserver_passwd', '')
        new_user_pwd = self.gen_pwd()
        sent = False
        existing_user = self.db(
            self.db.auth_users.auth_email==req_email).select(
                self.db.auth_users.auth_alias)
        if len(existing_user):
            self.db(self.db.auth_users.auth_email == req_email).update(
                auth_passwd=hashlib.sha1(new_user_pwd).hexdigest())
            if admin_email and mailserver and req_email:
                sender = [admin_email]
                recipients = [req_email]
                message = """You have requested a password reset from %s.

                Your new password is: %s

                QS-Stack Team""" % (URL(r=self.request,
                                        c='default',
                                        f='index'),
                                    new_user_pwd)
                session = smtplib.SMTP(mailserver)
                if username and passwd:
                    try:
                        session.login(username, passwd)
                    except:
                        pass
                try:
                    smtpresult = session.sendmail(sender, recipients, message)
                except:
                    smtpresult = 'Error' # TODO: Elaborate

                if smtpresult:
                    sent = False
                else:
                    sent = True
        else:
            sent = False
        return sent

    def gen_pwd(self):
        # Generates a relatively easy to remember "password" which should
        # NOT be used as the main one, usually for temporarily password
        # assignments.
        vowels = 'aeiou'
        consonants = 'bcdfghjklmnpqrstvwxyz'
        password = ''
        # Some default values should be in the parameters section
        minpairs = 4
        maxpairs = 6

        for x in range(1, random.randint(int(minpairs), int(maxpairs))):
            consonant = consonants[random.randint(1, len(consonants) - 1)]
            if random.choice([1,0]):
                consonant = consonant.upper()
            password = password + consonant
            vowel = vowels[random.randint(1, len(vowels) - 1)]
            if random.choice([1,0]):
                vowel = vowel.upper()
            password = password + vowel

        return password

    def pagination_widget(self, total, start, otype, href, qs):
        """ A Pagination Widget """

        # total = total number of results
        # start = zero-based index of first result to be displayed
        #         (e.g. page 3 of 5 10-batch pages starts with 20)
        # otype = questions, answers, comments
        # href  = url
        # qs    = any QS variables you wish to add in addition to the
        #         "?start=[x]" qs returned...

        if qs is None:
            qs = ''
        else:
            qs = '&%s' % (qs)

        html_code = []

        batch = int(self.get_system_property('s_%s_per_page' % (otype), 15))

        # current page number. add first to prevent zero division errors.
        current = (start + batch) / batch

        # total number of pages. use ceiling to catch a remainder.
        pages = int(math.ceil(float(total) / float(batch)))

        # Need to modify the widget to return a more user-friendly pagination
        # UI, in the form:
        # [Previous 10] [Previous] 1 2 3 4 5 6 7 [8] 9 10 [Next] [Next 10]
        # If Click on "next 10" then show:
        # [Previous 10] [Previous] 11 12 13 14 15 16 17 [18] 19 20 (cont'd)
        # [Next] [Next 10]
        # Assuming there are 25 "pages":
        # [Previous 10] [Previous] 21 22 23 24 [25] [Next] [Next 10]
        # Things to consider:
        # - If on page 28 of a 32 page widget, click on "Next 10" must go to
        # the "last" (32) number, not 38
        # - "Previous", "Previous 10", "Next" and "Next 10" must be disabled
        # when appropriate

        PAGE_SET = 10
        sets_to_display = pages / PAGE_SET
        reminder_pages  = pages % PAGE_SET
        if reminder_pages:
            extra_page = 1
        else:
            extra_page = 0
        sets_to_display += extra_page

        real_sets_to_display = total / float(batch)

        if real_sets_to_display > 1:
            html_code.append('<div style="text-align:center;">Navigation:')

            if start >= (batch * PAGE_SET):
                html_code.append('[<a href="%s?start=%s%s" title="">Previous %s</a>]&nbsp;' % (href, start - (batch * PAGE_SET), qs, PAGE_SET))
            #else:
            #    html_code.append('<span class="note">[Previous %s]</span>' % (PAGE_SET))

            if start - batch >= 0:
                html_code.append('[<a href="%s?start=%s%s" title="">Previous</a>]&nbsp;' % (href, start - batch, qs))
            else:
                html_code.append('<span class="note">[Previous]</span>')

            # Need to find the right "range", for example on a 10-page set of 3-results-per-page for 44 total results,
            # If I click page 6, the range must be 1 2 3 4 5 6 7 8 9 10
            # If I am on page 11, then click on 15, the range must be 11 12 13 14 15 16 17 18 19 20
            # and so on (Note 16 17 18 19 20 must be disabled)
            start_number = 0
            end_number = PAGE_SET
            mid_number = (start / batch) + 1
            while 1:
                if mid_number >= start_number and mid_number <= end_number:
                    break
                start_number = end_number
                end_number = start_number + PAGE_SET

            page = start_number * batch

            this_range = range(1 + start_number, end_number + 1)

            for idx in this_range:
                if idx == (start + batch) / batch:
                    html_code.append('<b>%s</b>&nbsp;' % (str(idx)))
                else:
                    if idx * batch - batch < total:
                        html_code.append('<a href="%s?start=%s%s" title="">%s</a>&nbsp;' % (href, page, qs, idx))

                page += batch

            if start + batch < total:
                html_code.append('[<a href="%s?start=%s%s" title="">Next</a>]&nbsp;' % (href, start + batch, qs))
            else:
                html_code.append('<span class="note">[Next]</span>')

            if start + (batch * PAGE_SET) < total:
                tot = start + (batch * PAGE_SET)
                html_code.append('[<a href="%s?start=%s%s" title="">Next %s</a>]&nbsp;' % (href, tot, qs, PAGE_SET))
            #else:
            #    html_code.append('<span class="note">[Next %s]</span>' % (PAGE_SET))

            html_code.append('</div>')

        return '\n'.join(html_code)

    def get_user_rank(self, new_votes):
        # This functions similar to get_user_roles() but this method
        # returns a possible "new" role based on the number of votes
        # that the user has now
        role_name = 'Unknown Role'
        try:
            role_name = self.db(
                new_votes>=self.db.auth_roles.role_min_score).select(
                    self.db.auth_roles.role_name,
                    orderby=~self.db.auth_roles.role_min_score,
                    limitby=(0,1))[0].role_name
        except IndexError:
            pass
        except TypeError:
            pass
        return role_name

    def get_user_points(self, user_id):
        """ Simple helper that returns the number of points currently awarded
        to the user.

        """
        pts_up = int(self.get_member_property('m_points_up', user_id, 0))
        pts_dn = int(self.get_member_property('m_points_dn', user_id, 0))
        return pts_up - pts_dn


    def update_user_rank(self, user_id, new_votes):
        # Updates the rank of a user (if needed). Here it can get a bit
        # problematic, since an admin can potentially give a user a higher role
        # and when the system updates this user (i.e. the user earns more
        # points, etc). Basically the role name cannot be "downsized" but it
        # can be "upsized"

        changed = False
        # Get all roles and put them on a list
        all_roles = self.db().select(
            self.db.auth_roles.ALL,
            orderby=self.db.auth_roles.role_min_score)
        role_list = [role.role_name for role in all_roles]

        # Now get this user's role data, and the index of the role in the list
        user_role = self.get_user_role(user_id)
        try:
            user_role_idx = role_list.index(user_role)
        except ValueError:
            user_role_idx = -1 # Unknown Role

        # Ok, so far so good, now I have the user_role variable containing the
        # current user role, now, based on the new_votes value, let's get his
        # potentially new role:
        new_user_role = self.get_user_rank(new_votes)
        try:
            new_user_role_idx = role_list.index(new_user_role)
        except ValueError:
            new_user_role_idx = -1 # Unknown Role

        # Only update if the new user role is greater than the previous one
        if new_user_role_idx > user_role_idx:
            # Get the primary key for this role:
            role_id = self.db(
                self.db.auth_roles.role_name==new_user_role).select(
                    self.db.auth_roles.id)[0].id
            self.db(self.db.auth_users.id==user_id).update(
                auth_role_id=role_id)
            changed = True
            # User does not need to login/logout since I am not caching the
            # role authorization (yet), this will only happen if needed.
        return changed

    def get_user_role(self, user_id):
        """ Returns a string containing the role the user belongs to """
        role_name = 'Unknown Role'
        try:
            role_name = self.db(
                (self.db.auth_users.auth_role_id == self.db.auth_roles.id) &
                (self.db.auth_users.id == user_id)
                ).select(
                self.db.auth_roles.role_name)[0].role_name
        except IndexError:
            pass
        except TypeError:
            pass
        return role_name

    def get_system_points(self, event_name, event_type):
        # Returns the pointing system defined in the documentation.
        # event_name is 'Q', 'A', 'C'
        # event_type is 'up', 'down', 'outstanding', 'offensive'
        point_system = { # Question-related points
                        'Qfeatured': 5,
                        'Qoffensive': -5,
                        'Qvotedn': -1,
                        'Qvoteup': 1,
                        # Answer-Related points
                        'Aaccepted': 2,
                        'Aoffensive': -5,
                        'Aoutstanding': 5,
                        'Avotedn': -1,
                        'Avoteup': 1,
                        # Comment-related points
                        'Coffensive': -5,
                        'Cvotedn': 0,
                        'Cvoteup': 0}
        return point_system.get('%s%s' % (event_name, event_type), 0)


    def get_sidebar_tags(self):
        # Kids, never use code to generate html. Having said that, here we go
        start_px = 22
        cnt = 0
        bold_toggle = True
        tag_cnt = self.db.question_tags.id.count()
        tags = self.db(self.db.tags.id==self.db.question_tags.tag_id).select(
            self.db.tags.tagname,
            tag_cnt,
            groupby=self.db.tags.id,
            orderby=~tag_cnt,
            limitby=(0, 12))
        html = ''
        for tag in tags:
            tagname = tag.tags.tagname
            tag_cnt = tag['COUNT(question_tags.id)']
            if bold_toggle:
                html_stub = 'font-weight:bold;'
                bold_toggle = False
            else:
                html_stub = ''
                bold_toggle = True
            url = URL(r=self.request,
                      c='default',
                      f='index',
                      args=['tags'],
                      vars=dict(tag=tagname))
            html += '<span style="font-size:%spx;%s">\
            <a href="%s" title=""\
            >%s</a></span>&nbsp \n' % (start_px, html_stub, url, tagname)
            if cnt % 2:
                start_px -= 2
            cnt += 1
        return html


    def __get_user_id(self, auth_user):
        return self.db(self.db.auth_users.auth_alias==auth_user).select(
            self.db.auth_users.id)[0].id


    def user_can_vote(self):
        # Please See Documentation
        allowed_roles = 'Contributor,Reviewer,TeamLead,Manager,SysAdmin'
        return self.auth_user.has_role(allowed_roles)