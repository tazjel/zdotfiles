# -*- coding: utf-8 -*-

#########################################################################
## This is a samples controller
## - index is the default action of any application
## - user is required for authentication and authorization
## - download is for downloading files uploaded in the db (does streaming)
## - call exposes all registered services (none by default)
#########################################################################

import datetime
import hashlib
import base64

from gluon.contrib.login_methods.email_auth import email_auth

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


def index():
    """
    Main application index (entry point) page
    """
    if session.RUN_ONCE is None:
        view_info = {}
        view_info.update({'errors': []})
        req = request.vars
        args = request.args
        nav_css = 'aquestions'
        # Some needed system information (think about caching this and
        # update every 4 hours or so..)
        num_recs = int(
            stackhelper.get_system_property('s_questions_per_page', 30))
        mode = ''
        try:
            offset = int(req.start)
        except:
            offset = 0
        try:
            mode = args[0]
            nav_css = 'a%s' % (mode)
        except:
            pass
        sort_css = 's_dates' if req.sort is None else req.sort

        # Constraints:
        # Sort (qsort):
        # Latest == order by questions.modified_on DESC
        # Most Voted = order by questions.votes_up DESC
        # Featured = where questions.is_featured == 'T'
        #
        # Type (qtype)
        # Questions = (no constraints)
        # Unanswered = where questions.is_answered == 'F'
        qsort = req.sort # Latest, Most Voted (Sub Tabs)
        # qtype = req.qtype - Questions, Unanswered (Main Tabs)

        sql_order = 'questions.modified_on DESC'
        if qsort == 's_votes': # "most voted"
            sql_order = 'questions.votes_up DESC'

        qtype = ''
        if len(args) > 0:
            qtype_arg = args[0]
            if qtype_arg == 'unanswered':
                qtype = 'u'
            elif qtype_arg == 'featured':
                qtype = 'f'
            elif qtype_arg == 'subscribed':
                qtype = 's'
        sql_where = []
        extra_tables = [''] # <-- Important
        if qtype == 'u': # Unanswered
            sql_where.append("questions.is_answered = 'F'")
        elif qtype == 'f': # Featured
            sql_where.append("questions.is_featured = 'T'")
        elif qtype == 's': # Subscribed
            sql_where.append("questions.id = "
                             "question_subscriptions.question_id")
            sql_where.append("question_subscriptions.is_active = 'T'")
            sql_where.append("question_subscriptions.auth_user_id = "
                             "%s" % (auth_user.get_user_id() or 0))
            extra_tables.append('question_subscriptions')

        # Tag Handling
        srch_tag = ''
        tag_table = ''
        if mode == 'tags':
            srch_tag = req.get('tag', 'qa-stack') # /default/index/tags?tag=meh
            # get the "id" of this tag..
            sql_tags = db(
                db.tags.tagname.like('%s%%' % (srch_tag))).select(db.tags.id)
            tags = ','.join([str(tag.id) for tag in sql_tags]) # '1,5,7,9,etc'

            sql_where.append('question_tags.question_id = questions.id')
            sql_where.append('question_tags.tag_id in (%s)' %
                             (tags if tags else 0))
            extra_tables.append('question_tags')

        sql_where_str = ''
        if sql_where:
            sql_where_str = "\nand %s" % (' and '.join(sql_where))
        # Grab questions
        sql_cnt = """
        select
            count(questions.id)
        from
            questions
            %s
        where
            questions.is_visible='T'
            %s
        """ % (','.join(extra_tables), sql_where_str)
        question_cnt = db.executesql(sql_cnt)[0][0]
        view_info['question_cnt'] = question_cnt
        sql = """
        select
            questions.title,
            questions.created_on,
            questions.modified_on,
            questions.views,
            questions.votes_up,
            questions.votes_dn,
            questions.is_answered,
            questions.is_featured,
            member_properties.property_value,
            COUNT(answers.id),
            auth_roles.role_name,
            questions.is_closed,
            questions.id,
            auth_users.auth_alias,
            auth_users.id
        from
            questions LEFT JOIN answers ON answers.question_id=questions.id,
            auth_users,
            member_properties,
            member_properties_skel,
            auth_roles
            %s
        where
            questions.is_visible='T'
            AND member_properties.auth_user=questions.created_by
            AND member_properties.property_id=member_properties_skel.id
            AND member_properties_skel.property_name='m_display_name'
            AND auth_roles.id=auth_users.auth_role_id
            AND auth_users.id=questions.created_by
            %s
        group by
            questions.id
        order by
            %s
            limit %s offset %s
        """ % (','.join(extra_tables), sql_where_str, sql_order, num_recs,
               offset)
        questions = []
        all_questions = db.executesql(sql)
        if all_questions:
            for q in all_questions:
                questions.append({
                    'questions.title': q[0],
                    'questions.created_on': q[1],
                    'questions.modified_on': q[2],
                    'questions.views': q[3],
                    'questions.votes_up': q[4],
                    'questions.votes_dn': q[5],
                    'questions.is_answered': (True if q[6] == 'T' else False),
                    'questions.is_featured': (True if q[7] == 'T' else False),
                    'member_properties.property_value': q[8],
                    'answers_id_count': q[9],
                    'auth_roles.role_name': q[10],
                    'questions.is_closed': (True if q[11] == 'T' else False),
                    'questions.id': q[12],
                    'tags': None,
                    'auth_users.auth_alias': q[13],
                    'auth_users.id': q[14]})
        # Get tags for questions
        for q in questions:
            tags = db(
                (db.questions.id==db.question_tags.question_id) &
                (db.question_tags.tag_id==db.tags.id) &
                (db.questions.id==q['questions.id'])).select(
                db.tags.tagname)
            #raise ValueError, tags
            if tags:
                q['tags'] = tags

        return dict(view_info=view_info,
                    questions=questions,
                    nav_css=nav_css,
                    sort_css=sort_css)
    else:
        # So apparently we have a new system install, redirect to the
        # appropriate page:
        redirect(URL(r=request, c='default', f='runonce'))


def view():
    """ The default page when viewing a question """
    # We need to pull here several important things: Questions, comments for
    # questions, answers, comments for answers..
    view_info = {'errors': []}

    req = request.vars
    qid = req.qid if req.qid is not None else request.args[0] # Question ID

    # Read the question here to see if the user is allowed to access it
    question = db(db.questions.id==qid).select(db.questions.ALL)
    user_id = auth_user.get_user_id()
    if not question or (
        not question[0].is_visible and not auth_user.is_admin()):
        # Only admins may see hidden questions..
        redirect(URL(r=request, c='default', f='unauthorized'))

    featured_votes = db(
        (db.score_log.l_type=='Q') &
        (db.score_log.subtype=='featuredrequest') &
        (db.score_log.qac_id==qid)).count()
    view_info.update(dict(featured_votes=featured_votes))

    offensive_votes = db(
        (db.score_log.l_type=='Q') &
        (db.score_log.subtype=='offensiverequest') &
        (db.score_log.qac_id==qid)).count()
    view_info.update(dict(offensive_votes=offensive_votes))

    # This controls if the user is subscribed or not to this question
    view_info['is_subscribed'] = False
    if auth_user.is_auth():
        if stackhelper.user_is_subscribed(qid, user_id):
            view_info['is_subscribed'] = True

    # Only the following roles can add comments
    can_comment = auth_user.has_role('Reviewer,TeamLead,Manager,SysAdmin')
    view_info['can_comment'] = can_comment
    if req.form_submitted:
        view_info['form_submitted'] = True
        preview_answer = req.preview_answer
        post_answer = req.post_answer
        answer = req.get('answer', '').strip()
        view_info['answer'] = answer
        if preview_answer is not None:
            view_info['preview_answer'] = preview_answer
        else:
            # Posting an answer to this question here
            if answer:
                modified_by = user_id
                db.answers.insert(question_id=qid,
                                  description=answer,
                                  created_by=modified_by,
                                  created_on=request.now,
                                  modified_by=modified_by,
                                  is_outstanding=False,
                                  votes_up=0,
                                  votes_dn=0,
                                  is_visible=True,
                                  is_answer=False,
                                  modified_on=request.now)
                # Update the original question's last update date/user
                db(db.questions.id==qid).update(modified_by=modified_by,
                                                modified_on=request.now)
                # Also, increment the number of answers this user has posted
                stackhelper.increment_member_property('m_answers',
                                                      modified_by,
                                                      1)
            else:
                view_info['errors'].append(
                    'Please add a valid answer to continue')
    else:
        # Update the page views for this question, only
        # if the page is viewed via GET
        view_rec = db(db.questions.id==qid).select(db.questions.views)[0]
        db(db.questions.id==qid).update(views=view_rec.views+1)

    question = db(
        (db.questions.id==qid) &
        (db.questions.created_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')).select(
        db.questions.ALL,
        db.member_properties.property_value)[0]
    tags = db(
        (db.questions.id==db.question_tags.question_id) &\
        (db.question_tags.tag_id==db.tags.id) &\
        (db.questions.id==question.questions.id)).select(
        db.tags.tagname)
    q_comments = db(
        (db.comments.c_type=='Q') &
        (db.comments.qa_id==qid) &
        (db.comments.is_visible==True) &
        (db.comments.created_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name==\
         'm_display_name')).select(db.comments.ALL,
        db.member_properties.property_value,
        orderby=db.comments.modified_on)
    answers = db(
        (db.answers.question_id==qid) &
        (db.answers.is_visible==True) &
        (db.answers.created_by==db.member_properties.auth_user) &
        (db.member_properties.property_id==db.member_properties_skel.id) &
        (db.member_properties_skel.property_name=='m_display_name')).select(
        db.answers.ALL,
        db.member_properties.property_value,
        orderby=~db.answers.is_answer|~db.answers.modified_on)
    # Now every different proposed answer can have comments,
    # so I need the comments for each answer if applicable)
    comments_a = {}
    for answer in answers:
        comments = db(
            (db.comments.c_type=='A') &
            (db.comments.qa_id==answer.answers.id) &
            (db.comments.is_visible==True) &
            (db.comments.created_by==db.member_properties.auth_user) &
            (db.member_properties.property_id==db.member_properties_skel.id) &
            (db.member_properties_skel.property_name==\
             'm_display_name')).select(
            db.comments.ALL,
            db.member_properties.property_value,
            orderby=db.comments.modified_on)
        if comments:
            comments_a.update({answer.answers.id: comments})
    return dict(
        question=question,
        tags=tags,
        q_comments=q_comments,
        answers=answers,
        comments_a=comments_a,
        can_comment=can_comment,
        view_info=view_info)

def tags():
    """ Returns a simple list of all the most popular tags """
    view_info = {}
    view_info.update(dict(errors=[]))
    tag_cnt = db.question_tags.id.count()
    tags = db(db.tags.id==db.question_tags.tag_id).select(
        db.tags.tagname,
        tag_cnt,
        groupby=db.tags.id,
        orderby=~tag_cnt,
        limitby=(0, 30))
    return dict(tags=tags,
                view_info=view_info)


def search():
    srch_txt = request.vars.srch_txt
    if len(srch_txt.strip()):
        url = URL(r=request, c='default', f='index', args=['tags'],
                  vars=dict(tag=srch_txt))
    else:
        url = URL(r=request, c='default', f='index')
    redirect(url)


def about():
    return dict()


def faq():
    return dict()


def bad_resource():
    """
    Possibly extend this to include meaningful information why the call
    to this method was made. """
    return dict()


def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    session.forget()
    return service()


def contact_admin():
    """ Contact Admin - This can allow anonymous users to post spam,
    so for them, I'll add some "poor man's captcha" """
    view_info = {}
    view_info['errors'] = []
    captcha = stackhelper.gen_pwd()
    view_info['anon_captcha'] = captcha
    view_info['anon_captcha_base64'] = base64.standard_b64encode(captcha)
    req = request.vars
    if req.form_submitted:
        if req.send_b:
            if req.subject and req.message:
                if auth_user.is_auth() or\
                (not auth_user.is_auth() and\
                 base64.standard_b64encode(req.captcha_response) == req.c):
                    db.admin_messages.insert(
                        auth_user_id=auth_user.get_user_id(),
                        subject=parse_content(req.subject),
                        message=parse_content(req.message),
                        creation_date=request.now,
                        read_flag=False)
                    redirect(URL(r=request, c='default', f='index'))
                else:
                    view_info['errors'].append(
                        'Invalid humanity challenge response, please try '
                        'again')
                    return dict(request=request, view_info=view_info)
            else:
                view_info['errors'].append(
                    'Both Subject and Message are required fields')
                return dict(request=request, view_info=view_info)
        else:
            redirect(URL(r=request, c='default', f='index'))
    else:
        return dict(request=request, view_info=view_info)


def runonce():
    if session.RUN_ONCE is not None:
        tmp_username = session['NEW_USER']
        tmp_passwd = session['NEW_USER_PASSWD']
        # Remove these values from the session now..
        session.RUN_ONCE = None
        session.NEW_USER_PASSWD = None
        session.RUN_ONCE = None
        return dict(tmp_username=tmp_username, tmp_passwd=tmp_passwd)
    else:
        # Just die silently..
        redirect(URL(r=request, c='default', f='index'))


def unauthorized():
    return dict()