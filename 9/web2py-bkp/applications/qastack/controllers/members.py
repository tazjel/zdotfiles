# -*- coding: utf-8 -*-

#########################################################################
# Members Controller
# Please try to conform to PEP-8 as much as possible
# http://www.python.org/dev/peps/pep-0008/
#########################################################################

import datetime
import hashlib
import base64
# Janrain requirements
import urllib
import urllib2
try:
    import json
except ImportError:
    import simplejson as json

from gluon.contrib.login_methods.email_auth import email_auth


def signup():
    """
    Signup Module

    Creates a custom QA-Stack.com Account

    """
    custom_messages = {}
    custom_messages.update({'errors': []})
    req = request.vars
    # Next value used for future enhancements
    allow_registration = True
    custom_messages.update({'allow_registration': allow_registration})
    if req.form_submitted:
        if req.register_b:
            # User requests a new account, verify that all is in order
            email = req.auth_alias.lower()
            passwd = req.passwd
            passwd_c = req.passwd_c
            if email and passwd and passwd_c:
                if passwd == passwd_c:
                    # If program gets here it means that the user has passed
                    # the main validation, now we need to see if this
                    # email has already been used..
                    if db(db.auth_users.auth_alias.lower()==\
                          email).count() == 0:
                        # If test above is true, then the user is ok to
                        # be custom-added
                        # New User - add it with the default role of Member
                        # NOTE: THIS ROLE MUST EXIST
                        auth_role_id = db(db.auth_roles.role_name==\
                                          'Member').select(\
                                              db.auth_roles.id)[0].id
                        hash_passwd = hashlib.sha1('%s%s' %\
                                                   (email, passwd)).hexdigest()
                        # Insert the user
                        auth_user_id = db.auth_users.insert(
                            auth_alias=email,
                            auth_passwd=hash_passwd,
                            auth_created_on=request.now,
                            auth_modified_on=request.now,
                            is_enabled=True,
                            auth_role_id=auth_role_id)
                        # User is all set up, log him in automatically
                        # Probably expand this to verify is the user
                        # was 100% sure authenticated and redirect to the
                        # appropriate area if not, etc..
                        redirect(URL(r=request, c='members', f='login',
                                     vars=dict(auth_user=email)))
                    else:
                        # Otherwise advise that the user has been taken
                        custom_messages['errors'].append('This '
                                                         'email has already '
                                                         'been taken, please '
                                                         'select another one.')
                else:
                    custom_messages['errors'].append('Password and '
                                                     'confirmation'
                                                     ' do not match, please'
                                                     ' try again')
            else:
                custom_messages['errors'].append('Please make sure all '
                                                 'required fields are '
                                                 'filled in')
        else:
            # User requested cancel, send him back to the home page
            redirect(URL(r=request, c='default', f='index'))
    return dict(request=request, custom_messages=custom_messages)


def login():
    """ Login using custom qa-Stack.com Account """
    custom_messages = {}
    custom_messages.update({'errors': []})
    isauth = False
    req = request.vars
    if req.form_submitted:  # Come from form submisssion
        if req.login_b:  # Login is what you want (not pwd retrieval, etc)
            if req.google_account:  # Google account is requested
                try:
                    usr, domain = req.auth_alias.split('@')
                except IndexError:
                    usr = None
                    domain = ''
                google_auth = email_auth(server="smtp.gmail.com:587",
                                         domain=domain)
                if google_auth(email=req.auth_alias, password=req.passwd):
                    # Google authentication was correct, auhenticate_google()
                    # Will simply return "True" if the (already authenticated)
                    # user had an account already in QA-Stack, or False if
                    # qa-stack had to create the record entry for the
                    # first time
                    auth_user.authenticate_google(req.auth_alias, req.passwd)
                    isauth = True
                else:
                    custom_messages['errors'].append('Invalid Username '
                                                     'or Password entered')
            else:
                # No google account - Log in using our
                # custom authentication mechanism
                if auth_user.authenticate(req.auth_alias, req.passwd):
                    isauth = True
                else:
                    custom_messages['errors'].append('Invalid Username '
                                                     'or Password '
                                                     'entered')
            if isauth:
                if stackhelper.get_member_property('m_display_name',
                                                   auth_user.get_user_id(),
                                                   None) is None:
                    auth_no_domain = req.auth_alias
                    if req.auth_alias.find('@') >= 0:
                        auth_no_domain = req.auth_alias[:req.auth_alias.find(
                            '@')]
                    stackhelper.put_member_property('m_display_name',
                                                    auth_user.get_user_id(),
                                                    auth_no_domain)

        elif req.cancel_b:
            # Back to index
            redirect(URL(r=request, c='default', f='index'))
    # After all the hoopla, let's see if the user is authorized
    if isauth:
        # Grab the Language preferences here, and send it
        lang = stackhelper.get_member_property('m_locale',
                                               auth_user.get_user_id(),
                                               '')
        redirect(URL(r=request, c='default', f='index', vars=dict(lang=lang)))
    else:
        return dict(request=request, custom_messages=custom_messages)


def login_janrain():
    # Must be posted by the external calling process
    token = request.vars.token

    # Part of the Janrain API docs.
    api_params = {
    'token': token,
    'apiKey': 'a1357f66065bfa557d34c96d1116cbf50d8bf510',
    'format': 'json'}

    # make the api call
    http_response = urllib2.urlopen('https://rpxnow.com/api/v2/auth_info',
                                urllib.urlencode(api_params))
    # read the json response
    auth_info_json = http_response.read()

    # Process the json response
    auth_info = json.loads(auth_info_json)
    # Step 4) use the response to sign the user in
    if auth_info['stat'] == 'ok':
        profile = auth_info['profile']

        # 'identifier' will always be in the payload
        # this is the unique idenfifier that you use to sign the user
        # in to your site
        identifier = profile['identifier']

        # these fields MAY be in the profile, but are not guaranteed. it
        # depends on the provider and their implementation.
        name = profile.get('displayName')
        email = profile.get('email')
        profile_pic_url = profile.get('photo')

        # actually sign the user in.
        user_id = auth_user.authenticate_janrain(
            identifier,
            name,
            email,
            profile_pic_url)
        form_vars = {}

        # Now, update some properties
        stackhelper.put_member_property('m_last_login', user_id, request.now)
        # Only update Name (m_display_name) if the field is actually empty
        if stackhelper.get_member_property(
            'm_display_name',
            user_id,
            '') == '':
            stackhelper.put_member_property('m_display_name', user_id, name)
    else:
        # TODO: Do something more elegant than this
        #raise ValueError('An error occured: %s' % (auth_info['err']['msg']))
        form_vars = dict(login_error=auth_info['err']['msg'])
    redirect(URL(r=request, c='default', f='index', vars=form_vars))


@auth_user.requires_login()
def preferences():
    view_info = {}
    view_info['errors'] = []
    view_info['props'] = {}
    req = request.vars
    username = auth_user.get_user_name()
    user_id = auth_user.get_user_id()
    user_role_info = db((db.auth_users.auth_role_id==db.auth_roles.id) &
                        (db.auth_users.id==user_id)).select(
        db.auth_roles.role_name, db.auth_roles.color_designation)[0]
    view_info['props'].update({'user_role_name': user_role_info.role_name,
                               'user_role_color':
                               user_role_info.color_designation})
    user_email = username
    # Avatar Restrictions (px) - Maybe we need to make these dynamic??
    AVATAR_MAX_HEIGHT = 100
    AVATAR_MAX_WIDTH = 120
    AVATAR_MAX_SIZE = 15000  # Bytes
    view_info['props'].update(
        {'questions': stackhelper.get_member_property('m_questions',
                                                      user_id, '0')})
    view_info['props'].update(
        {'real_name': stackhelper.get_member_property('m_real_name', user_id,
                                                      '')})
    view_info['props'].update(
        {'web_page': stackhelper.get_member_property('m_web_page',
                                                     user_id, '')})
    view_info['props'].update(
        {'country': stackhelper.get_member_property('m_country',
                                                    user_id, '')})
    view_info['props'].update(
        {'locale': stackhelper.get_member_property('m_locale',
                                                   user_id, '')})
    view_info['props'].update(
        {'display_name': stackhelper.get_member_property('m_display_name',
                                                         user_id, '')})
    view_info['props'].update(
        {'answers': stackhelper.get_member_property('m_answers',
                                                    user_id, '0')})
    view_info['props'].update(
        {'comments': stackhelper.get_member_property('m_comments',
                                                     user_id, '0')})
    view_info['props'].update(
        {'second_email': stackhelper.get_member_property('m_email',
                                                  user_id, '')})
    view_info['props'].update(
        {'points_up': stackhelper.get_member_property('m_points_up',
                                                      user_id, '0')})
    view_info['props'].update(
        {'points_dn': stackhelper.get_member_property('m_points_dn',
                                                      user_id, '0')})
    question_subscriptions = db(
        (db.question_subscriptions.auth_user_id==user_id) &
        (db.question_subscriptions.is_active==True) &
        (db.questions.id==db.question_subscriptions.question_id)).select(
            db.questions.id, db.questions.title)
    if req.form_submitted:
        if req.update_b:
            # Standard Properties
            stackhelper.put_member_property('m_real_name', user_id,
                                            req.real_name)
            stackhelper.put_member_property('m_web_page', user_id,
                                            req.web_page)
            stackhelper.put_member_property('m_country', user_id, req.country)
            stackhelper.put_member_property('m_display_name', user_id,
                                            req.display_name)
            stackhelper.put_member_property('m_email', user_id,
                                            req.second_email)

            # Question Subscriptions
            remove_questions_subscription = req.remove_questions_subscription
            if remove_questions_subscription:
                #raise ValueError, remove_question_subscriptions
                stackhelper.del_question_subscription(
                    remove_questions_subscription,
                    user_id)

            # Password Changes
            if req.new_passwd or req.new_passwd_confirm:
                if req.new_passwd == req.new_passwd_confirm:
                    # Probably need to offset this to its own security class,
                    # So far there are several (few however) places where I
                    # perform security updates.
                    hash_passwd = hashlib.sha1(
                        '%s%s' % (user_email, req.new_passwd)).hexdigest()
                    db(db.auth_users.auth_alias==user_email).update(
                        auth_passwd=hash_passwd)
                else:
                    view_info['errors'].append('Password and confirmation do '
                                               'not match, please try again')

            # Avatars
            if req.remove_avatar:
                db(db.member_avatars.auth_user_id==user_id).update(
                    avatar_active=False)

            # Crude verification of a FileUpload object set
            try:
                filename = req.avatar_data.filename
            except AttributeError:
                filename = None

            if filename:
                # Resource:
                # http://epydoc.sourceforge.net/stdlib/ [cont'd next line]
                # cgi.FieldStorage-class.html
                image_data = req.avatar_data.file.read()
                content_type = req.avatar_data.type  # "image/png"
                doc_type, ext = content_type.split('/')
                if doc_type == 'image':
                    c_type, width, height = \
                          stackhelper.get_image_info(image_data)
                    update_avatar = True
                    if height > AVATAR_MAX_HEIGHT or width > AVATAR_MAX_WIDTH:
                        view_info['errors'].append(
                            'Image dimensions exceed the '
                            'limits set by the '
                            'administrator: '
                            '(H:%spx, W:%spx)' % (height, width))
                        update_avatar = False
                    if len(image_data) > AVATAR_MAX_SIZE:
                        view_info['errors'].append(
                            'Avatar exceeds the maximum image size set by the '
                            'administrator: %s bytes' % (len(image_data)))
                        update_avatar = False

                    if update_avatar:
                        if stackhelper.has_member_avatar(
                            user_id, bypass=False):
                            # Update:
                            db(db.member_avatars.auth_user_id==user_id).update(
                                content_type=content_type,
                                avatar_image=image_data,
                                avatar_active=True)
                        else:
                            # Add:
                            db.member_avatars.insert(content_type=content_type,
                                                     auth_user_id=user_id,
                                                     avatar_image=image_data,
                                                     avatar_active=True)

            if view_info['errors']:
                return dict(request=request,
                            view_info=view_info,
                            username=username,
                            user_email=user_email,
                            user_id=user_id,
                            question_subscriptions=question_subscriptions)
            else:
                redirect(URL(
                    r=request,
                    c='members',
                    f='preferences',
                    vars=dict(saved=1)))
        else:
            redirect(URL(r=request, c='default', f='index'))
    else:
        return dict(request=request,
                    view_info=view_info,
                    username=username,
                    user_email=user_email,
                    user_id=user_id,
                    question_subscriptions=question_subscriptions)


@auth_user.requires_login()
def ask():
    view_info = {}
    view_info.update({'errors': []})
    req = request.vars
    form_submitted = req.form_submitted
    if form_submitted:
        title = req.question_title
        question = req.question
        tags = '' if req.tags is None else req.tags.lower()
        tag_lst = list(set(tags.split(',')))
        preview_question = req.preview_question
        post_question = req.post_question
        if title and question and tags:
            view_info['can_post'] = True
            if preview_question:
                # Need to send the user back with the preview
                preview_html = parse_content(question)
                view_info['question_preview'] = preview_html
            elif post_question:
                # Store the question in the DB
                # Information Needed:
                # User ID
                # Title, Actual Question
                user_id = auth_user.get_user_id()
                question_id = db.questions.insert(
                    title=title,
                    description=question,
                    created_by=user_id,
                    created_on=request.now,
                    modified_by=user_id,
                    modified_on=request.now,
                    votes_up=0,
                    votes_dn=0,
                    is_answered=False,
                    is_closed=False,
                    is_featured=False,
                    is_visible=True,
                    views=0)
                # Next, add the specified tags
                for tag in tag_lst:
                    if tag.strip():
                        tag_r = db(db.tags.tagname==tag).select(db.tags.ALL)
                        if tag_r:
                            tag_id = tag_r[0].id
                        else:
                            # This tag does not exist, add it to our tags table
                            tag_id = db.tags.insert(tagname=tag,
                                                    is_enabled=True)

                        # Now assign this tag to the question
                        db.question_tags.insert(question_id=question_id,
                                                tag_id=tag_id)
                # Now subscribe this user if hs/she requested to do so
                if req.subscribe:
                    db.question_subscriptions.insert(auth_user_id=user_id,
                                                     question_id=question_id,
                                                     is_active=True)
                # Also, increment the number of questions this user has posted
                stackhelper.increment_member_property('m_questions',
                                                      user_id,
                                                      1)
                # Send the user to the "View Question" page
                redirect(URL(r=request, c='default', f='view',
                             args=[question_id]))
        else:
            view_info['errors'].append('Question title, description and tags'
                                       ' are required.')
    return dict(view_info=view_info)


@auth_user.requires_login()
def comment_question():
    view_info = {'errors': []}
    # I need the original question here and also the comments peertaining
    # to this question..
    req = request.vars
    qid = req.qid if req.qid is not None else request.args[0]
    user_id = auth_user.get_user_id()
    question = db(
        (db.questions.id==qid) &
        (db.questions.modified_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')
        ).select(
        db.questions.ALL,
        db.member_properties.property_value)[0]
    tags = db(
        (db.questions.id==db.question_tags.question_id) &
        (db.question_tags.tag_id==db.tags.id) &
        (db.questions.id==question.questions.id)
        ).select(
        db.tags.tagname)
    q_comments = db(
        (db.comments.c_type=='Q') &
        (db.comments.qa_id==qid) &
        (db.comments.is_visible==True) &
        (db.comments.modified_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')
        ).select(
        db.comments.ALL,
        db.member_properties.property_value,
        orderby=~db.comments.modified_on)
    if req.form_submitted:
        if req.cancel:
            redirect(URL(r=request, c='default', f='view', args=[qid]))
        else:
            preview_comment = req.preview_comment
            post_comment = req.post_comment
            comment = req.comment
            if comment:
                if preview_comment:
                    # Need to send the user back with the preview
                    preview_html = parse_content(comment)
                    view_info['comment_preview'] = preview_html
                    view_info['can_post'] = True
                elif post_comment:
                    # Store the comment for this question
                    modified_by = user_id
                    db.comments.insert(c_type='Q',
                                       qa_id=qid,
                                       description=comment,
                                       created_by=modified_by,
                                       created_on=request.now,
                                       modified_by=modified_by,
                                       votes_up=0,
                                       votes_dn=0,
                                       is_visible=True,
                                       modified_on=request.now)
                    # Update the question's last update date/user
                    db(db.questions.id==qid).update(modified_by=modified_by,
                                                    modified_on=request.now)
                    # Also, increment the number of questions
                    # this user has posted
                    stackhelper.increment_member_property('m_comments',
                                                          modified_by,
                                                          1)
                    redirect(URL(r=request, c='default', f='view', args=[qid]))
            else:
                view_info['errors'].append('Please add a valid '
                                           'comment to continue')
    return dict(view_info=view_info,
                question=question,
                tags=tags,
                comments=q_comments)


@auth_user.requires_login()
def comment_answer():
    view_info = {'errors': []}
    req = request.vars
    user_id = auth_user.get_user_id()
    # aid = Answer ID, qid = Question ID
    if req.form_submitted is None:
        qid = request.args[0]
        aid = request.args[1]
    else:
        qid = req.qid
        aid = req.aid

    if req.form_submitted is not None:
        if req.cancel:
            redirect(URL(r=request, c='default', f='view', args=[qid]))
        else:
            preview_comment = req.preview_comment
            post_comment = req.post_comment
            comment = req.comment
            if comment:
                if preview_comment:
                    # Need to send the user back with the preview
                    preview_html = parse_content(comment)
                    view_info['comment_preview'] = preview_html
                    view_info['can_post'] = True
                elif post_comment:
                    # Store the comment for this question
                    modified_by = user_id
                    db.comments.insert(c_type='A',
                                       qa_id=aid,
                                       description=comment,
                                       created_by=modified_by,
                                       created_on=request.now,
                                       modified_by=modified_by,
                                       modified_on=request.now,
                                       votes_up=0,
                                       votes_dn=0,
                                       is_visible=True)
                    # Update the original question's last update date/user
                    db(db.questions.id==qid).update(modified_by=modified_by,
                                                    modified_on=request.now)
                    # Also, increment the number of questions this user
                    # has posted
                    stackhelper.increment_member_property('m_comments',
                                                          modified_by,
                                                          1)
                    redirect(URL(r=request,
                                 c='default',
                                 f='view',
                                 args=[qid],
                                 anchor='answer%s' % (aid)))
            else:
                view_info['errors'].append('Please add a valid '
                                           'comment to continue')

    question = db(
        (db.questions.id==qid) &
        (db.questions.modified_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')
        ).select(
        db.questions.ALL,
        db.member_properties.property_value)[0]
    tags = db(
        (db.questions.id==db.question_tags.question_id) &
        (db.question_tags.tag_id==db.tags.id) &
        (db.questions.id==question.questions.id)
        ).select(
        db.tags.tagname)
    answer = db(
        (db.answers.id==aid) &
        (db.answers.is_visible==True) &
        (db.answers.modified_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')).select(
        db.answers.ALL,
        db.member_properties.property_value)[0]
    a_comments = db(
        (db.comments.c_type=='A') &
        (db.comments.qa_id==aid) &
        (db.comments.is_visible==True) &
        (db.comments.modified_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')
        ).select(
        db.comments.ALL,
        db.member_properties.property_value,
        orderby=~db.comments.modified_on)
    return dict(question=question,
                answer=answer,
                tags=tags,
                a_comments=a_comments,
                view_info=view_info)


def vote():
    # Sample Args: ['question', '1', 'up', '1'], ['answer', '3', 'down', '2'],
    # etc - Values are:
    # args[0] - 'question', 'answer', 'comment'
    # args[1] - ID of the question, answer or comment
    # args[2] - 'up', 'down'
    # args[3] - Original Question ID
    # Fail miserably (on purpose) if args does not specifically contain 4 args
    #
    # User can upvote or downvote only once, they may revoke a previous upvote
    # or downvote.  Managers (and above) are not restricted
    error_codes = {0: '',
                   1: 'You may not up vote the same entry twice.',
                   2: 'You may not vote up or down anymore on this entry.',
                   3: 'You may not down vote the same entry twice.',
                   5: 'You do not have the required permissions to up/down '
                   'vote entries.',
                   6: 'You may not up/down vote your own posts.'}
    anchor = 'questionMain'
    user_id = auth_user.get_user_id()
    qac_type, qac_id, up_dn, qid = request.args
    err = 0
    # Set the variable below explicitly to False if you don't want sysadmins
    # from multiple up/down voting or from up/down voting own posts, in fact,
    # make this a system-wide property as soon as possible to add more
    # flexibility to the system
    is_sysadmin = auth_user.has_role('SysAdmin')
    if stackhelper.user_can_vote():
        assert up_dn in ('up', 'down',)  # Totally
        c_type = 'Q' if qac_type == 'question' \
               else 'A' if qac_type == 'answer' else 'C'
        # Get the vote count for this question/answer/comment
        if c_type == 'Q':  # Vote on a Question
            # In this particular case, qid=qac_id
            object_info = db(db.questions.id==qac_id).select(
                db.questions.votes_up,
                db.questions.votes_dn,
                db.questions.created_by)[0]  # Must Exist
            anchor = 'questionMain'
        elif c_type == 'A':  # Vote on an answer
            object_info = db(db.answers.id==qac_id).select(
                db.answers.votes_up,
                db.answers.votes_dn,
                db.answers.created_by)[0]  # Must Exist
            anchor = 'answer%s' % (qac_id)
        else:  # Vote on a comment
            object_info = db(db.comments.id==qac_id).select(
                db.comments.votes_up,
                db.comments.votes_dn,
                db.comments.created_by)[0]  # Must Exist
            anchor = 'comment%s' % (qac_id)

        # Here we create a nifty little variable that will prevent the
        # user (any user) from awarding points to him/herself by
        # up/down voting their own posts...
        can_log_points = user_id != object_info.created_by
        # If you want SysAdmins/Managers to allow then multiple voting up/dn
        # and voting on own posts, uncomment the below line:
        can_log_points = can_log_points or is_sysadmin

        if can_log_points:

            # This is now generic for all kinds of up/down voting
            votes_up = object_info.votes_up
            votes_dn = object_info.votes_dn
            if up_dn == 'up':
                votes_up += 1
            elif up_dn == 'down':
                votes_dn += 1

            # This will be needed to add a score_log entry eventually
            subtype = 'voteup' if up_dn == 'up' else 'votedn'

            # Points to be awarded to this user (can be negative)
            # whic incidentally will be abs()'ed since we have a field
            # in member_properties specifically for them
            points = stackhelper.get_system_points(c_type, subtype)

            # Now, need to update the appropriate table with the new values.
            # If you are a Manager+ there is no check, otherwise, see if you
            # have up/dn vote this before..
            score_log_insert = False
            if is_sysadmin:
                score_log_insert = True
            else:
                # Here is when things get a little iffy, in this scenario,
                # you may:
                # DOWNVOTE: Only if you have no previous record of
                # up/dn vote for
                #           this particular record (question/answer/comment),OR
                #           you have previously UPVOTED this particular record.
                # UPVOTE: Only if you have no previous record of up/dn vote for
                #         this particular record (question/answer/comment), OR
                #         you have previously UPVOTED this particular record.
                upvotes = db((db.score_log.subtype=='voteup') &
                             (db.score_log.qac_id==qac_id) &
                             (db.score_log.l_type==c_type) &
                             (db.score_log.sender==user_id)).count()
                dnvotes = db((db.score_log.subtype=='votedn') &
                             (db.score_log.qac_id==qac_id) &
                             (db.score_log.l_type==c_type) &
                             (db.score_log.sender==user_id)).count()
                if subtype == 'voteup':
                    if upvotes > dnvotes:
                        # You may not up vote the same question twice
                        err = 1
                    elif upvotes == dnvotes and upvotes == 1:
                        # You may not vote up or down anymore 4 this Q
                        err = 2
                    else:
                        # Allow Upvoting
                        score_log_insert = True
                else:  # 'votedn'
                    if dnvotes > upvotes:
                        # You may not down vote the same question twice
                        err = 3
                    elif upvotes == dnvotes and upvotes == 1:
                        # You may not vote up or down anymore for this Q
                        err = 2
                    else:
                        # Allow Downvote
                        score_log_insert = True

            if score_log_insert:
                #raise ValueError(upvotes, dnvotes,qac_id,subtype,c_type)
                db.score_log.insert(l_type=c_type,
                                    subtype=subtype,
                                    qac_id=qac_id,
                                    points=points,
                                    sender=user_id,
                                    created_on=request.now)
                # In addition, update the votes up/down of either the
                # questions, comments or answers tables

                if c_type == 'Q':  # Question
                    db(db.questions.id==qac_id).update(votes_up=votes_up,
                                                       votes_dn=votes_dn)
                elif c_type == 'A':  # Answer
                    db(db.answers.id==qac_id).update(votes_up=votes_up,
                                                     votes_dn=votes_dn)
                else:  # Default to Comments, make sure you assert that
                    db(db.comments.id==qac_id).update(votes_up=votes_up,
                                                      votes_dn=votes_dn)

                # In addition, update the auth_role_id of the user that will
                # receive the "points"
                # Note, to this version, only up/dn votes on questions and
                # answers are awarded points to matter for the user's prof.
                # Comments do not. (this coud change though)
                # Also here update the user's appropriate fields pertaining
                # points
                if c_type in ('Q', 'A',):
                    # Will receive the points
                    target_user_id = object_info.created_by
                    if points >= 0:
                        points_prop = 'm_points_up'
                    else:
                        points_prop = 'm_points_dn'

                    stackhelper.increment_member_property(points_prop,
                                                          target_user_id,
                                                          abs(points))
                    stackhelper.update_user_rank(
                        target_user_id,
                        stackhelper.get_user_points(target_user_id))
        else:
            # "Your up/down voting operation yielded no points...
            # ...You may not up/down vote your own posts"
            err = 6
    else:
        # User Cannot Vote.. this most likely will never happen as
        # the link is disabled on the UI for non-allowed voters..
        # You do not have the required permissions to up/down vote entries.
        err = 5

    if err:
        anchor = 'error'

    if request.vars.get('from_ajax'):
        #if err:
        return error_codes.get(err, "Unknown Error Code: %s" % (err))
        #else:
        #    return "Votes Updated. Vote count is now %s." % (
        #        votes_up - votes_dn)
    else:
        redirect(URL(r=request,
                     c='default',
                     f='view',
                     args=[qid],
                     vars=dict(error_code=error_codes.get(
                        err, "Unknown Error Code: %s" % (err)), err=err,
                               anchor=anchor)))


@auth_user.requires_login()
def subscribe():
    qid = request.args[0]
    stackhelper.add_question_subscription(qid, auth_user.get_user_id())
    redirect(URL(r=request, c='default', f='view', args=[qid]))


@auth_user.requires_login()
def toggle_answer():
    answer_id, question_id = request.args
    # First, remove any possible "answered" flag for any possible answer
    # for this question, this will onl work if you are an admin or are the
    # owner of this question, answer can be changed multiple times, beware
    # of possible abuse
    err = 0
    user_id = auth_user.get_user_id()
    allowed = db((db.questions.created_by==user_id) &
                 (db.questions.id==question_id)).count() > 0
    if auth_user.has_role('SysAdmin') or allowed:
        # Ok, you are allowed to toggle this question's answered flag
        # Step 1 - Remove other possible answered flags
        db(db.answers.question_id==question_id).update(is_answer=False)
        # Step 2 - Update this particular answer with the "is_answered" status
        db(db.answers.id==answer_id).update(is_answer=True)
        # Step 3 - Update the question's "is_answered" flag
        db(db.questions.id==question_id).update(is_answered=True)
        # Next, Award the user the appropriate points for this answer
        # For this, I need to know who will be the "recipient" of the points
        # Note that the previous user's points will not be widthdrawed from
        # his/her profile. In addition, the user may not re-assign a
        # previously assigned answer to the same user.
        # In addition, the user that posts the question and adds an answer
        # AND approves the answer cannot get points either
        recipient_user_id = db(db.answers.id==answer_id).select(
            db.answers.created_by)[0].created_by
        previous_rec = db(
            (db.score_log.l_type=='A') &
            (db.score_log.subtype=='madeanswer') &
            (db.score_log.qac_id==answer_id)).count() > 0
        if recipient_user_id == user_id:
            # "Your accepted answer has been changed, however,
            # no points have been awarded since you cannot self-award
            # points for your own answer
            err = 5
        elif previous_rec:
            # "Your accepted answer has been changed, however,
            # no points have been awarded since this answer had
            # previously been marked as accepted"
            err = 4
        else:
            pts = stackhelper.get_system_points('Aaccepted', 'A')
            stackhelper.increment_member_property('m_points_up',
                                                  recipient_user_id,
                                                  pts)
            # Also add this entry in the logs too
            db.score_log.insert(l_type='A',
                                subtype='madeanswer',
                                qac_id=answer_id,
                                points=pts,
                                sender=user_id,
                                created_on=request.now)
    # Redirect the user back to the view page
    redirect(URL(r=request,
                 c='default',
                 f='view',
                 args=[question_id],
                 vars=dict(err=str(err))))


@auth_user.requires_role('Reviewer,TeamLead.Manager,SysAdmin')
def flag():
    # qac_type = 'question', 'answer', 'comment'
    # qac_id   = actual ID of the question, answer or comment
    # qac_flag = 'featured', 'offensive', 'outstanding'
    #
    # Questions can be "featured" or "offensive"
    # Answers can be "outstanding" or "offensive"
    # Comments can be "offensive"
    qac_type, qac_id, qac_flag = request.args
    qid = request.vars.qid
    user_id = auth_user.get_user_id()
    l_type = 'Q' if qac_type.startswith('q') else\
           'A' if qac_type.startswith('a') else 'C'

    db.score_log.insert(l_type=l_type,
                        subtype='%srequest' % (qac_flag),
                        qac_id=qac_id,
                        points=0,
                        sender=auth_user.get_user_id(),
                        created_on=request.now)

    # Get the count of entries for this object type
    flags = db((db.score_log.l_type==l_type) &
               (db.score_log.subtype=='%srequest' % (qac_flag)) &
               (db.score_log.qac_id==qac_id)).count()
    # Trigger if more than 3 members rerquest the same thing
    if flags >= 3:
        # Get the points to be awarded/removed
        pts = stackhelper.get_system_points(l_type, qac_flag)

        if l_type == 'Q':
            # Get this question:
            question = db(db.questions.id==qac_id).select(
                db.questions.created_by)[0]

            if qac_flag == 'featured':
                # Flag this question as featured
                db(db.questions.id==qac_id).update(is_featured=True)
                # Update this user's reputation
                stackhelper.increment_member_property('m_points_up',
                                                      question.created_by,
                                                      pts)
            else:  # offensive
                # Flag this question "invisible" (equivalent of "Closed"??)
                db(db.questions.id==qac_id).update(is_visible=False)
                # Update this user's reputation
                stackhelper.increment_member_property('m_points_dn',
                                                      question.created_by,
                                                      abs(pts))
            # Don't forget to update the member's Role
            stackhelper.update_user_rank(
                question.created_by,
                stackhelper.get_user_points(question.created_by))
        elif l_type == 'A':
            # Read this answer object
            answer = db(db.answers.id==qac_id).select(
                db.answers.created_by)[0]

            if qac_flag == 'outstanding':
                db(db.answers.id==qac_id).update(is_outstanding=True)
                # Update this user's reputation
                stackhelper.increment_member_property('m_points_up',
                                                      answer.created_by,
                                                      pts)
            else:  # offensive
                # "Hide" this answer
                db(db.answers.id==qac_id).update(is_visible=False)
                # Update this user's reputation
                stackhelper.increment_member_property('m_points_dn',
                                                      answer.created_by,
                                                      abs(pts))
            # Don't forget to update the member's Role
            stackhelper.update_user_rank(
                answer.created_by,
                stackhelper.get_user_points(answer.created_by))
        else:  # Comment
            # Get this comment's creator
            comment = db(db.comments.id==qac_id).select(
                db.comments.created_by)[0]
            # Make this comment "invisible"
            db(db.comments.id==qac_id).update(is_visible=False)
            # Update user's reputation
            stackhelper.increment_member_property(
                'm_points_dn',
                answer.created_by,
                abs(pts))
            # Update the user's rank
            stackhelper.update_user_rank(
                comment.created_by,
                stackhelper.get_user_points(comment.created_by))
        # Update our LOG table
        db.score_log.insert(
            l_type=l_type,  # Q, A, C
            subtype=qac_flag,  # offensive, featured, etc
            qac_id=qac_id,
            points=pts,
            sender=user_id,
            created_on=request.now)

    # Back to view.html
    redirect(URL(r=request, c='default', f='view', args=qid))


@auth_user.requires_login()
def unsubscribe():
    qid = request.args[0]
    stackhelper.del_question_subscription(qid, auth_user.get_user_id())
    redirect(URL(r=request, c='default', f='view', args=[qid]))


def get_avatar_image():
    auth_user_id = request.args[0]
    avatar_info = db(db.member_avatars.auth_user_id==auth_user_id).select(
        db.member_avatars.content_type,
        db.member_avatars.avatar_image)
    response.headers['Content-Type'] = '%s' % (avatar_info[0].content_type)
    return avatar_info[0].avatar_image


def logout():
    if 'lang' in session:  # session.has_key('lang') (pep8)
        del session['lang']
    auth_user.logout()
    redirect(URL(r=request, c='default', f='index', vars=dict(lang='')))


def flag_entry():
    # Creates an administrator message crafted specifically to inform
    # them of a possible offensive comment or answer posted by a jackass
    # entry_id is either answer_id or comment_id
    # question_id is as its name implies
    # entry_type is either 'comment', or 'answer'
    entry_id, question_id, entry_type = request.args
    # Cannot be None since caller is auth
    user_id = auth_user.get_user_id()
    user_name = stackhelper.get_member_property('m_display_name',
                                                user_id, '') or \
              auth_user.get_user_name()
    redirect_url = URL(r=request, c='default', f='view', args=[question_id])
    user_id_url = URL(r=request, c='admin', f='edit_user', args=[user_id])
    if entry_type == 'answer':
        entry = db(db.answers.id==entry_id).select(db.answers.ALL)[0]
    else:
        entry = db(db.comments.id==entry_id).select(db.comments.ALL)[0]
    message = """<a href="%s" title="">%s</a> has reported an inappropriate
    %s. The contents of the %s are:

    %s

    Question Location: <a href="%s" title="">%s</a>
    """ % (user_id_url,
           user_name,
           entry_type,
           entry_type,
           entry.description,
           redirect_url,
           redirect_url)
    db.admin_messages.insert(
        auth_user_id=user_id,
        subject="Inappropriate %s reported by %s" % (entry_type, user_name),
        message=parse_content(message),
        creation_date=request.now,
        read_flag=False)
    redirect(redirect_url)


@auth_user.requires_login()
def edit_question():
    """ Questions Can be edited:
    - By the creator of the question
    - By the SysAdmin
    Questions may not be edited:
    - If the question has already be answered
    - Except by the SysAdmin
    Questions can be made "hidden" by the sysadmin only

    """

    req = request.vars
    view_info = {'errors': []}
    auth_user_id = auth_user.get_user_id()
    if req.form_submitted:
        qid = req.qid
        # Save Form information
        if req.update_question:
            # Information needed at this point:
            title = req.question_title.strip()
            content = req.question.strip()
            tags = req.tags.lower().strip()
            if title and content and tags:
                # All seems to be fine at this point...
                # Update this question
                db(db.questions.id==qid).update(title=title,
                                                description=content,
                                                modified_by=auth_user_id,
                                                modified_on=request.now)
                # Update the tags for this question (remove/re_add)
                # This is a little tricky, since if a tag is removed, we
                # also need to remove or decrease the tag count from
                # out master tag table,

                # Grab the current tag ids that this question has (before
                # any updates)
                sql_tags = db((db.tags.is_enabled==True) &\
                    (db.question_tags.question_id==qid) &\
                    (db.question_tags.tag_id==db.tags.id)).select(
                    db.tags.id)
                current_tag_ids = [tag.id for tag in sql_tags]

                # wipe out all the tags for this question
                db(db.question_tags.question_id==qid).delete()
                new_tag_ids = []
                # Remove duplicates, don'twant to say it is a "hack" but it
                # just might be...
                tag_list = list(set(tags.lower().split(',')))
                for tag in tag_list:
                    # if this tag does not exist in the master tags table,
                    # add it, along with a reference to the ID into our
                    # question_tags table
                    if tag.strip():
                        is_tag = db(db.tags.tagname==tag).select(db.tags.id)
                        if is_tag:
                            # Tag exists already, use its id to add the new
                            # tag pertaining this question
                            tag_id = is_tag[0].id
                        else:
                            # No master tag exists, create it
                            tag_id = db.tags.insert(tagname=tag,
                                                    is_enabled=True)
                        # Finally, add this tag_id to our question_tags table
                        db.question_tags.insert(question_id=qid,
                                                tag_id=tag_id)
                        new_tag_ids.append(tag_id)
                redirect(URL(r=request, c='default', f='view', args=[qid]))
            else:
                view_info['errors'].append("Please make sure you specify "
                                           "Title, Question Content and "
                                           "at least one tag to continue.")
        elif req.hide_q and auth_user.is_admin():
            # Question is set to be "hidden" from public view,
            # this includes the question itself, the question's comments,
            # every question's answers and every question's answers'
            # comments, all points up/down votes etc remain the same

            # Hide the question
            db(db.questions.id==qid).update(is_visible=False)
            # The following will be temporarily disabled, as removing the
            # Question from public view will effectively hide the comments,
            # answers and comments on answers for this question,
            ## Hide the answers
            #db(db.answers.question_id==qid).update(is_visible=False)
            ## Hide the comments of the question
            #db((db.comments.c_type=='Q') &\
            #   (db.comments.qa_id==qid)).update(is_visible=False)
            ## Get all the answers for this question, and for each one
            ## of them, invalidate their respective comments
            #answers = db(db.answers.question_id==qid).select(db.questions.id)
            #for answer in answers:
            #    db((db.comments.c_type=='A') &\
            #       (db.comments.qa_id==answer.id)).update(is_visible=False)
            # The question is not "visible" anymore, redirect to home
            redirect(URL(r=request, c='default', f='index'))
        else:
            redirect(URL(r=request, c='default', f='view', args=[qid]))
    else:
        qid = request.args[0]
    # Grab the question
    question = db(db.questions.id==qid).select(db.questions.ALL)[0]
    # .. also get the tags
    sql_tags = db((db.tags.is_enabled==True) &\
        (db.question_tags.question_id==qid) &\
        (db.question_tags.tag_id==db.tags.id)).select(db.tags.tagname)
    tags = ','.join([tag.tagname for tag in sql_tags])
    # Set the can_edit flag here instead of in the view...
    can_edit = False
    if auth_user.is_admin():
        can_edit = True
    else:
        # No admin, can you still edit?
        if question.created_by == auth_user_id and\
                                question.is_visible and\
                                not (question.is_answered or\
                                     question.is_closed):
            can_edit = True
    return dict(question=question,
                view_info=view_info,
                tags=tags,
                can_edit=can_edit)


@auth_user.requires_login()
def edit_answer():
    """ Answers can be edited:
    - By the SysAdmin, regardless
    - By the Answer owner
    Answers may not be edited (SysAdmin except):
    - If te answer is marked as "answered" by the question originator/SysAdmin
    Answers can be hidden only by the sysadmin

    """
    req = request.vars
    view_info = {'errors': []}
    auth_user_id = auth_user.get_user_id()
    can_edit = False
    redir = False  # Flag to trigger redirection back to View Question page
    if req.form_submitted:
        aid = req.aid
        if req.update_answer:
            description = req.description.strip()
            if description:
                # All seems fine, update
                db(db.answers.id==aid).update(description=description,
                                              modified_by=auth_user_id,
                                              modified_on=request.now)
                # Then get out of here
                redir = True
            else:
                view_info['errors'].append("Please make sure you specify "
                                           "a valid content for your answer.")
        elif req.hide_a and auth_user.is_admin():
            # Answer is set to be "hidden" from public view,
            # this includes the answer itself, the answer's comments if any.
            # if the answer is marked as "answered", remove the flag also

            # Hide the answer and remove the answered flag
            db(db.answers.id==aid).update(
                is_visible=False,
                is_answer=False)
            # Hide the answer's comments
            # NOTE, This has been disabled, if an answer is disabled,
            # all of its comments will also be implicitly hidden as well.
            #db((db.comments.c_type=='A') &\
            #   (db.comments.qa_id==aid)).update(is_visible=False)

            # Get the question ID to redirect later..
            qid = db(db.answers.id==aid).select(
                db.answers.question_id)[0].question_id
            # The question is not "visible" anymore, redirect to home
            redirect(URL(r=request, c='default', f='view', args=[qid]))
    else:
        aid = request.args[0]

    answer = db(db.answers.id==aid).select(db.answers.ALL)[0]
    question = db(db.questions.id==answer.question_id).select(
        db.questions.ALL)[0]
    tags = db((db.tags.id==db.question_tags.tag_id) &\
              (db.question_tags.question_id==question.id)).select(
                  db.tags.tagname,
                  orderby=db.tags.tagname)

    if redir:
        redirect(URL(r=request, c='default', f='view', args=[question.id]))

    if auth_user.is_admin():
        can_edit = True
    else:
        # No admin, can you still edit?
        if answer.created_by == auth_user_id and\
           answer.is_visible and not\
               answer.is_answer:
            can_edit = True

    return dict(answer=answer,
                question=question,
                tags=tags,
                view_info=view_info,
                can_edit=can_edit)


def edit_comment():
    """ Comments can be edited:
    - By the SysAdmin, regardless
    - By the Comment owner
    Comments can be edited by the above regardless if the question,
    answer or comment has been marked as approved, declined, etc,
    since comments do not provide anythint

    """
    req = request.vars
    view_info = {'errors': []}
    auth_user_id = auth_user.get_user_id()
    can_edit = False
    redir = False  # Flag to trigger redirection back to View Question page
    if req.form_submitted:
        cid = req.cid
        qid = req.qid
        if req.update_comment:
            description = req.description.strip()
            if description:
                # All seems fine, update
                db(db.comments.id==cid).update(description=description,
                                               modified_by=auth_user_id,
                                               modified_on=request.now)
                # Then get out of here
                redir = True
            else:
                view_info['errors'].append("Please make sure you specify "
                                           "a valid content for your comment.")
        elif req.hide_c and auth_user.is_admin():
            # Comment is set to be "hidden" from public view,

            # Hide the comment
            db(db.comments.id==cid).update(is_visible=False)

            # Back to the view page
            redirect(URL(r=request, c='default', f='view', args=[qid]))
    else:
        cid, qid = request.args

    if redir:
        redirect(URL(r=request, c='default', f='view', args=[qid]))

    comment = db(db.comments.id==cid).select(db.comments.ALL)[0]

    if auth_user.is_admin():
        can_edit = True
    else:
        # No admin, can you still edit?
        if comment.created_by == auth_user_id and\
           comment.is_visible:
            can_edit = True

    return dict(comment=comment,
                view_info=view_info,
                cid=cid,
                qid=qid,
                can_edit=can_edit)
