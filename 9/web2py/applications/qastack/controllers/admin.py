#!/usr/bin/env python
# -*- coding: utf-8 -*-

# IDE "helper" not part of the framework
if False:
    from gluon.globals import *
    from gluon.html import *
    from gluon.http import *
    #from gluon.sqlhtml import SQLFORM, SQLTABLE, form_factory
    session = Session()
    request = Request()
    response = Response()
    # The following three lines are application-specific and used just so
    # komodo (edit) (or even other IDEs sich as Wing) "finds" the methods
    # for my classes, this does not have anyhing to do with the web2py
    # framework itself, as I am already instantiating "auth_user",
    # "stackhelper" etc in one of my models...
    from qastack.models import db
    from qastack.modules.CustomAuthentication import CustomAuthentication \
        as auth_user
    from qastack.modules.QAStackHelper import QAStackHelper as stackhelper


@auth_user.requires_role('SysAdmin')
def index():
    req = request.vars # /admin/function?tag=value
    # view_type possible values = (nothing) --> default to "unread"
    # "read" and "all"
    # read_modifier is a variable that controls the "read" or "unread" state
    # of the data to be pulled from the "admin_messages" table
    read_modifier = None
    view_type = req.get('view_type', 'unread')
    if view_type == 'unread':
        read_modifier = False
    elif view_type == 'read':
        read_modifier = True
    # Nasty-truncate for preview purposes
    msgs = db.admin_messages.message[:40]
    
    # Here, if deletion of messages was requested, carry out the request...
    form_submitted = req.form_submitted
    msg_ids = req.msg_ids
    if msg_ids is not None:
        if not type(msg_ids) is list:
            msg_ids = [msg_ids]
        db(db.admin_messages.id.belongs(msg_ids)).delete()
    
    # First condition triggers if the admin user does pick a "modifier"
    # meaning that he elected, "show me the read" or "show me the unread" msgs
    if read_modifier is not None:
        # I will need an inner join on a left join, please read
        # http://groups.google.com/group/web2py/browse_thread/thread/
        # d7f5e5820176813/d418ba81180fe40a?lnk=gst&q=multiple+left+
        # joins#d418ba81180fe40a
        # For more info on why I wil need to make a second pass on the
        # generated resultset, not a biggie, a bit annoying though.
        messages = db(db.admin_messages.read_flag==read_modifier).select(
            db.admin_messages.id,
            db.admin_messages.auth_user_id,
            db.admin_messages.subject,
            msgs,
            db.admin_messages.creation_date,
            db.admin_messages.read_flag,
            orderby=~db.admin_messages.creation_date
        )
    else:
        # Second condition is if the admin user wants to see both read and
        # unread admin messages...
        messages = db().select(
            db.admin_messages.id,
            db.admin_messages.auth_user_id,
            db.admin_messages.subject,
            msgs,
            db.admin_messages.creation_date,
            db.admin_messages.read_flag,
            orderby=~db.admin_messages.creation_date
        )
    return dict(messages=messages)


@auth_user.requires_role('SysAdmin')
def system():
    req = request.vars
    if req.form_submitted:
        #raise ValueError(req.property_names)
        # Save Changes Requested
        for p_name in req.property_names:
            db(db.system_properties.property_name==p_name).update(
                property_value=req.get(p_name, ''))
        redirect(URL(r=request, c='admin', f='system', vars=dict(saved=1)))
    else:
        sys_properties = db().select(db.system_properties.ALL)
        return dict(sys_properties=sys_properties)


@auth_user.requires_role('SysAdmin')
def users():
    view_options =  None
    users = db(db.auth_users.auth_role_id==db.auth_roles.id).select(
        db.auth_users.ALL,
        db.auth_roles.role_name,
        orderby=~db.auth_roles.role_min_score)
    user_dict = {}
    for user in users:
        user_dict.update({user.auth_users.id:
                          {'user_real_name':
                           stackhelper.get_member_property(
                               'm_display_name',
                               user.auth_users.id,
                               '')}})
    return dict(view_options=view_options,
                users=users,
                user_dict=user_dict)


@auth_user.requires_role('SysAdmin')
def edit_user():
    view_info = {}
    view_info['errors'] = []
    view_info['props'] = {}
    req = request.vars
    user_id = request.args[0] # /admin/edit_user/1000
    admin_username = auth_user.get_user_name()
    admin_user_id = auth_user.get_user_id()
    # roles will be used in the page
    roles = db().select(
        db.auth_roles.ALL, orderby=db.auth_roles.role_min_score)
    # To get the selected user username (located in member_properties)
    # I will query the table directly
    username = db(
        db.auth_users.id==user_id).select(
        db.auth_users.auth_alias)[0].auth_alias
    #username = db(
    #    (db.member_properties_skel.property_name=='m_display_name') &
    #    (db.member_properties_skel.id==db.member_properties.property_id) &
    #    (db.member_properties.auth_user==user_id)).select(
    #    db.member_properties.property_value)[0].property_value
    user_role_info = db(
        (db.auth_users.auth_role_id==db.auth_roles.id) &
        (db.auth_users.id==user_id)).select(
        db.auth_roles.role_name,
        db.auth_roles.id,
        db.auth_roles.color_designation)[0]
    view_info['props'].update({'user_role_name': user_role_info.role_name,
                               'user_role_color':
                               user_role_info.color_designation})
    user_email = username
    # Avatar Restrictions (px) - Maybe we need to make these dynamic??
    AVATAR_MAX_HEIGHT = 100
    AVATAR_MAX_WIDTH  = 120
    AVATAR_MAX_SIZE   = 15000 # Bytes
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
            # Was a change in roles requested?
            if int(req.new_role) != user_role_info.id:
                # Yes, then change it
                db(db.auth_users.id==user_id).update(
                    auth_role_id=req.new_role)
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
                content_type = req.avatar_data.type # "image/png"
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
                            roles=roles,
                            question_subscriptions=question_subscriptions)
            else:
                # Save was successful
                redirect(URL(r=request, c='admin', f='edit_user', args=[user_id], vars=dict(saved=1)))
        else:
            # Cancel Requested - back to admin "main" screen
            redirect(URL(r=request, c='admin', f='users'))
    else:
        return dict(request=request,
                    view_info=view_info,
                    username=username,
                    user_email=user_email,
                    user_id=user_id,
                    roles=roles,
                    question_subscriptions=question_subscriptions)


@auth_user.requires_role('SysAdmin')
def view_admin_message():
    message = db(db.admin_messages.id==request.args[0]).select(
        db.admin_messages.ALL)[0]
    # In addition, update this message's status to "read"
    db(db.admin_messages.id==request.args[0]).update(read_flag=True)
    return dict(message=message)


@auth_user.requires_role('SysAdmin')
def qa_mgmt():
    """ Main page to control question/answer/comment management, usually
    to manage any of those that have been flagged for deletion.
    
    """
    q_cnt = db(db.questions.is_visible==False).count()
    qc_cnt = db((db.comments.c_type=='Q') & (
        db.comments.is_visible==False)).count()
    a_cnt = db(db.answers.is_visible==False).count()
    ac_cnt = db((db.comments.c_type=='A') & (
        db.comments.is_visible==False)).count()
    return dict(q_cnt=q_cnt, qc_cnt=qc_cnt, a_cnt=a_cnt, ac_cnt=ac_cnt)


@auth_user.requires_role('SysAdmin')
def qa_mgmt_hq():
    """ Management of questions that have been marked for possible deletion
    by a sysadmin.
    
    """
    questions = db(db.questions.is_visible==False).select(
        db.questions.ALL, orderby=~db.questions.modified_on)
    return dict(questions=questions)


@auth_user.requires_role('SysAdmin')
def qa_mgmt_hqc():
    """ Management of commments for a question that have been marked for
    possible deletion by a sysadmin.
    
    """    
    questions = db(
        (db.questions.id==db.comments.qa_id) & (db.comments.c_type=='Q') & (
            db.comments.is_visible==False)).select(
        db.comments.qa_id, db.comments.description, db.comments.id,
        db.questions.id, db.questions.title, db.comments.modified_on,
        orderby=~db.comments.modified_on)
    return dict(questions=questions)


@auth_user.requires_role('SysAdmin')
def qa_mgmt_ha():
    """ Management of answers that have been marked for possible deletion
    by a sysadmin.
    
    """
    answers = db((db.questions.id==db.answers.question_id) & (
        db.answers.is_visible==False)).select(
        db.questions.id, db.questions.title, db.answers.description,
        db.answers.id, db.answers.modified_on)
    return dict(answers=answers)
    

@auth_user.requires_role('SysAdmin')
def qa_mgmt_hac():
    """ Management of commments for an answer that have been marked for
    possible deletion by a sysadmin.
    
    """
    questions = db((db.comments.is_visible==False) & (
        db.comments.c_type=='A') & (db.comments.qa_id==db.answers.id) & (
        db.answers.question_id==db.questions.id)).select(
        db.comments.description, db.comments.id, db.comments.modified_on,
        db.questions.id, db.questions.title,
        db.answers.description, db.answers.id,
        orderby=~db.comments.modified_on)
    return dict(questions=questions)
    

@auth_user.requires_role('SysAdmin')
def qa_mgmt_actions():
    """ This really should be a "helper" method for a module instead
    of a controller method, ask Massimo what would be the _preferred_
    way of doing things here, since this only executes "stuff" and redirects
    back to the calling page.
    
    """
    # "action", "action_type" and "question" are always provided as "vars"
    req = request.vars
    action = req.action
    action_type = req.action_type
    question = req.question
    
    # Request restore of a hidden question:
    if action == 'release' and action_type == 'question':
        # Here basically change the flag of the question, all of the
        # other question's siblings (comments, answers, and answers
        # to comments should become visible as well
        db(db.questions.id==question).update(is_visible=True)
        redirect(URL(r=request, c='admin', f='qa_mgmt_hq'))
    elif action == 'remove' and action_type == 'question':
        # This is a little bit more "complex" so to speak, the following
        # rules will apply:
        # Question is deleted.
        # Comments on the actual question, as well as answers and comments
        # on these answers are also removed.
        # Points awarded, etc remain.
        
        # 1. Remove all comments for this question
        db((db.comments.c_type=='Q') & (db.comments.qa_id==question)).delete()
        
        # 2. Get all the possible answers for this question
        answers = db(db.answers.question_id==question).select(db.answers.id)
        
        # 3. for each answer, remove all its comments and the answer itself
        if answers:
            # Store all of our answer_ids
            a_ids = [answer.id for answer in answers]
            # Remove any comments for any of the answer ids stored above
            db((db.comments.c_type=='A') & (
                db.comments.qa_id.belongs(tuple(a_ids)))).delete()
            # Remove all the answers for this question
            db(db.answers.question_id==question).delete()
            
        # 4. Remove the actual question.
        db(db.questions.id==question).delete()
        
        # 5. Clean up stub tables:
        # Remove the references of this question from the subscriptions
        # table in case some members have this question marked
        db(db.question_subscriptions.question_id==question).delete()
        # Remove the tags associated with this question
        db(db.question_tags.question_id==question).delete()
        redirect(URL(r=request, c='admin', f='qa_mgmt_hq'))
    elif action == 'release' and action_type == 'answer':
        # Another easy one, just change the flag of the answer's
        answer = req.answer
        db(db.answers.id==answer).update(is_visible=True)
        redirect(URL(r=request, c='admin', f='qa_mgmt_ha'))
    elif action == 'remove' and action_type == 'answer':
        # In this case, I need to remove this answer's comments and the
        # answer itself
        answer = req.answer
        db((db.comments.c_type=='A') % (db.comments.qa_id==answer)).delete()
        db(db.answers.id==answer).delete()
        redirect(URL(r=request, c='admin', f='qa_mgmt_ha'))
    elif action == 'release' and action_type == 'comment':
        # In this case we just need to make this comment visible, since we
        # have the comment.id it should be pretty straightforward
        db(db.comments.id==req.comment).update(is_visible=True)
        redirect(URL(r=request, c='admin', f='qa_mgmt'))
    elif action == 'remove' and action_type == 'comment':
        # Also easy, remove the comment
        db(db.comments.id==req.comment).delete()
        redirect(URL(r=request, c='admin', f='qa_mgmt'))
    else:
        redirect(URL(r=request, c='admin', f='qa_mgmt', vars=dict(invalid_selection=True)))
    
