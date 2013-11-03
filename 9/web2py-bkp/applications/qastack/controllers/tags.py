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

def index():
    """
    Main application index page
    ****** UPDATE *******
    """
    custom_messages = {}
    custom_messages.update({'errors': []})
    req = request.vars
    # Some needed system information (think about caching this and update every
    # 4 hours or so..)
    num_recs = int(stackhelper.get_system_property('s_questions_per_page', 30))
    offset = int(0 if not req.offset else req.offset)
    # Constraints:
    # Sort (qsort):
    # Latest == order by questions.modified_on DESC
    # Most Voted = order by questions.votes_up DESC
    # Featured = where questions.is_featured == 'T'
    #
    # Type (qtype)
    # Questions = (no constraints)
    # Unanswered = where questions.is_answered == 'F'
    qsort = req.qsort # Latest, Most Voted, Featured
    qtype = req.qtype # Questions, Unanswered
    tag = req.tag # Clcked on a specific tag
    sql_where = []
    sql_order = 'questions.modified_on DESC'
    if qsort == 'v': # "most voted"
        sql_order = 'questions.votes_up DESC'
    elif qsort == 'f': # Featured
        sql_where.append("questions.is_featured == 'T'")
    
    if qtype is not None and qtype == 'u': # Unanswered
        sql_where.append("questions.is_answered == 'T'")
    if sql_where:
        sql_where_str = "\nand %s" % (' and '.join(sql_where))
    # Grab all questions
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
        auth_users.auth_alias
    from
        questions LEFT JOIN answers ON answers.question_id=questions.id,
        auth_users,
        member_properties,
        member_properties_skel,
        auth_roles
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
    """ % (sql_where_str, sql_order, num_recs, offset)
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
                'auth_users.auth_alias': q[13]
                })
    # Get tags for questions
    for q in questions:        
        tags = db(
            (db.questions.id==db.question_tags.question_id) &\
            (db.question_tags.tag_id==db.tags.id) &\
            (db.questions.id==q['questions.id'])
            ).select(
            db.tags.tagname
            )
        #raise ValueError, tags
        if tags:
            q['tags'] = tags
        
    #questions = db(
    #    (db.questions.is_visible==True) &\
    #    (db.member_properties.auth_user==db.questions.created_by) &\
    #    (db.member_properties.property_id==db.member_properties_skel.id) &\
    #    (db.member_properties_skel.property_name=='m_display_name') &\
    #    (db.auth_roles.id==db.auth_users.auth_role_id) &\
    #    (db.auth_users.id==db.questions.created_by))._select(\
    #    db.questions.title,
    #    db.questions.created_on,
    #    db.questions.modified_on,
    #    db.questions.views,
    #    db.questions.votes_up,
    #    db.questions.votes_dn,
    #    db.questions.is_answered,
    #    db.questions.is_featured,
    #    db.member_properties.property_value,
    #    db.answers.id.count(),
    #    db.auth_roles.role_name,
    #    db.questions.is_closed,
    #    left=db.answers.on(db.answers.question_id==db.questions.id),
    #    groupby=db.questions.id,
    #    orderby=~db.questions.modified_on,
    #    limitby=(offset, num_recs))
    #raise ValueError, questions
    return dict(custom_messages=custom_messages, questions=questions)
