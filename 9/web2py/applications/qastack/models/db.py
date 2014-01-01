#!/usr/bin/env python
# -*- coding: utf-8 -*-

import hashlib
import sys
import os

# Adds our "Modules" folder to our environment path
path = os.path.join(request.folder, 'modules')
if not path in sys.path:
    sys.path.append(path)

from gluon.tools import *

# Control Migrations
migrate = False  # False if DB Schema already exists (? - Read Docs Pls)
fake_migrate = False  # True to regen table info for EXISTING tables (run once)

db = DAL('sqlite://qastack.sqlite', migrate=migrate)
#db = DAL('mysql://web2py:py2web@ds9.virtual:3306/qastack')

# Import Authentication/Authorization
from CustomAuthentication import CustomAuthentication
# Misc Methods QA-Stack-Specific
from QAStackHelper import QAStackHelper

auth_user = CustomAuthentication(globals(), db)
stackhelper = QAStackHelper(globals(), db, auth_user)
service = Service(globals())  # for json, xml, jsonrpc, xmlrpc, amfrpc

## Authentication Schema (2 tables)
db.define_table('auth_roles',
    Field('role_name', 'string', length=128, required=True),
    Field('role_min_score', 'integer', required=True),
    Field('color_designation', 'text', length=6, required=False, default=''),
    migrate='auth_roles.table', fake_migrate=fake_migrate)

db.define_table('auth_users',
    # Whatever login name the user authenticated with
    Field('auth_alias', 'string', length=255, required=True),
    Field('auth_passwd', 'string', length=255, required=True),
    Field('auth_created_on', 'datetime', required=True, default=request.now),
    Field('auth_modified_on', 'datetime', required=True, default=request.now),
    Field('is_enabled', 'boolean', required=True, default=True),
    Field('auth_role_id', db.auth_roles),
    migrate='auth_users.table', fake_migrate=fake_migrate)

# System Properties - Used by the system itself
db.define_table('system_properties',
    Field('property_name', 'string', length=128, required=True),
    Field('property_desc', 'text', required=True),
    Field('property_value', 'text', required=True),
    migrate='system_properties.table', fake_migrate=fake_migrate)

# Member Properties (Skeleton) (Available member Properties)
db.define_table('member_properties_skel',
    Field('property_name', 'string', length=128, required=True),
    Field('property_desc', 'text', required=True),
    Field('member_editable', 'boolean', default=False),
    Field('sort_order', 'integer', default=0, required=True),
    migrate='member_properties_skel.table', fake_migrate=fake_migrate)

# Member Properties (For each member)
db.define_table('member_properties',
    Field('auth_user', db.auth_users),
    Field('property_id', db.member_properties_skel),
    Field('property_value', 'string', length=255, required=True),
    migrate='member_properties.table', fake_migrate=fake_migrate)

# Avatars
db.define_table('member_avatars',
    Field('content_type', 'string', length=128, required=True),
    Field('auth_user_id', 'integer', required=True),
    Field('avatar_image', 'blob', required=True, default=None),
    Field('avatar_active', 'boolean', required=True, default=True),
    migrate='member_avatars.table', fake_migrate=fake_migrate)

# Questions
db.define_table('questions',
    Field('title', 'string', length=255, required=True),
    Field('description', 'text', required=True),
    Field('created_by', db.auth_users),
    Field('created_on', 'datetime', required=True),
    Field('modified_by', db.auth_users),
    Field('modified_on', 'datetime', required=True),
    Field('votes_up', 'integer', required=True, default=0),
    Field('votes_dn', 'integer', required=True, default=0),
    Field('is_answered', 'boolean', required=True, default=False),
    Field('is_closed', 'boolean', required=True, default=False),
    Field('is_featured', 'boolean', required=True, default=False),
    Field('is_visible', 'boolean', required=True, default=True),
    Field('views', 'integer', required=True, default=1),
    migrate='questions.table', fake_migrate=fake_migrate)

# Answers
db.define_table('answers',
    Field('question_id', db.questions),
    Field('description', 'text', required=True),
    Field('votes_up', 'integer', required=True, default=0),
    Field('votes_dn', 'integer', required=True, default=0),
    Field('created_by', db.auth_users),
    Field('created_on', 'datetime', required=True),
    Field('modified_by', db.auth_users),
    Field('modified_on', 'datetime', required=True),
    Field('is_answer', 'boolean', required=True, default=False),
    Field('is_visible', 'boolean', required=True, default=True),
    Field('is_outstanding', 'boolean', required=True, default=False),
    migrate='answers.table', fake_migrate=fake_migrate)

# Comments - Comments get up/dn points but do not count towards
# the user's profile
db.define_table('comments',
    Field('c_type', 'text', required=True),  # 'Q' or 'A'
    Field('qa_id', 'integer', required=True),  # ID of question or answer
    Field('description', 'text', required=True),
    Field('votes_up', 'integer', required=True, default=0),
    Field('votes_dn', 'integer', required=True, default=0),
    Field('created_by', db.auth_users),
    Field('created_on', 'datetime', required=True),
    Field('modified_by', db.auth_users),
    Field('modified_on', 'datetime', required=True),
    Field('is_visible', 'boolean', required=True, default=True),
    migrate='comments.table', fake_migrate=fake_migrate)

# Score Log
db.define_table('score_log',
    # 'Q', 'A', 'C'
    Field('l_type', 'string', required=True),
    # 'voteup', 'votedn', 'offensive', 'outstanding', 'featured', 'accepted'
    Field('subtype', 'string', required=True),
    Field('qac_id', 'integer', required=True),
    Field('points', 'integer', required=True),
    Field('sender', db.auth_users),
    Field('created_on', 'datetime', required=True),
    migrate='score_log.table', fake_migrate=fake_migrate)

# Simple Tag System
db.define_table('tags',
    Field('tagname', 'string', required=True, length=255),
    Field('is_enabled', 'boolean', required=True, default=True),
    migrate='tags.table', fake_migrate=fake_migrate)

# Tag/Question relationship
db.define_table('question_tags',
    Field('question_id', db.questions),
    Field('tag_id', db.tags),
    migrate='question_tags.table', fake_migrate=fake_migrate)

# Question Subscriptions - Everytime the user subscribes to a question,
# an entry is made here
db.define_table('question_subscriptions',
    Field('auth_user_id', db.auth_users),
    Field('question_id', db.questions),
    Field('is_active', 'boolean', default=True, required=True),
    migrate='question_subscriptions.table', fake_migrate=fake_migrate)

# When a question is updated, an email notification would be sent to all the
# Subscribed users, a record will be created here for the cron job to pick up
# and process
db.define_table('subscriptions_notification',
    Field('subscription_id', db.question_subscriptions),
    Field('created_on', 'datetime', required=True),
    Field('processed_on', 'datetime', required=False, default=None),
    # Important
    migrate='subscriptions_notification.table', fake_migrate=fake_migrate)

# "Queue" messages sent to the administrators (All admins can view )
db.define_table('admin_messages',
    Field('auth_user_id', db.auth_users),
    Field('subject', 'string', length=255, required=True),
    Field('message', 'text', required=True),
    Field('creation_date', 'datetime', required=True),
    Field('read_flag', 'boolean', default=False, required=True),
    migrate='admin_messages.table', fake_migrate=fake_migrate)

# This code sets up some defaults if the system is installed
# for the first time on a new instance.
if not db(db.system_properties.id > 0).count():
    system_list = []
    system_list.append({'property_name': 's_questions_per_page',
                        'property_desc': 'Number of results to show on '
                        'a single page',
                        'property_value': '15'})
    system_list.append({'property_name': 's_answers_per_page',
                        'property_desc': 'Number of answers to display on a '
                        'single page for a question',
                        'property_value': '15'})
    system_list.append({'property_name': 's_comments_per_page',
                        'property_desc': 'Number of comments to display for '
                        'every answer',
                        'property_value': '15'})
    system_list.append({'property_name': 's_allow_member_avatars',
                        'property_desc': 'If empty, users will not be given '
                        'the choice of adding or change their avatars, any '
                        'other value will enable avatars for all registered '
                        'users in the system',
                        'property_value': 'yes'})
    system_list.append({'property_name': 's_system_language',
                        'property_desc': 'Sets the default system language, '
                        'if invalid it will default to English (US)',
                        'property_value': 'en'})
    system_list.append({'property_name': 's_info_html',
                        'property_desc': 'Informational HTML: This can '
                        'contain '
                        'html code and will be shown at the top most position '
                        'in the navigaton section',
                        'property_value': 'Welcome to QA-Stack!'})
    db.system_properties.bulk_insert(system_list)

if not db(db.auth_roles.id > 0).count():
    role_list = []
    role_list.append({'role_name': 'Member',
                      'role_min_score': '0',
                      'color_designation': 'FFFFFF'})
    role_list.append({'role_name': 'Contributor',
                      'role_min_score': '11',
                      'color_designation': 'B6D7A8'})
    role_list.append({'role_name': 'Reviewer',
                      'role_min_score': '51',
                      'color_designation': 'FFE599'})
    role_list.append({'role_name': 'TeamLead',
                      'role_min_score': '101',
                      'color_designation': '9FC5E8'})
    role_list.append({'role_name': 'Manager',
                      'role_min_score': '501',
                      'color_designation': 'C27BA0'})
    role_list.append({'role_name': 'SysAdmin',
                      'role_min_score': '10001',
                      'color_designation': 'BF9000'})
    db.auth_roles.bulk_insert(role_list)

if not db(db.member_properties_skel.id > 0).count():
    prop_list = []
    prop_list.append({'property_name': 'm_last_login',
                      'property_desc': 'Last Login',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_display_name',
                      'property_desc': 'Display name to use for questions, '
                      'answers, etc, if blank, will default to auth',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_last_login_ip',
                      'property_desc': 'Last Login IP',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_questions',
                      'property_desc': 'Number of questions posted',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_answers',
                      'property_desc': 'Number of answers posted',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_comments',
                      'property_desc': 'Number of comments posted',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_locale',
                      'property_desc': 'Default display language',
                      'member_editable': '1',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_web_page',
                      'property_desc': 'Member URI/URL',
                      'member_editable': '1',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_country',
                      'property_desc': 'Member City/Country',
                      'member_editable': '1',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_join_date',
                      'property_desc': 'Join date',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_real_name',
                      'property_desc': 'Member full name',
                      'member_editable': '1',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_email',
                      'property_desc': 'Member secondary email address',
                      'member_editable': '1',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_points_up',
                      'property_desc': 'Number of points awarded',
                      'member_editable': '0',
                      'sort_order': '0'})
    prop_list.append({'property_name': 'm_points_dn',
                      'property_desc': 'Number of negative points awarded',
                      'member_editable': '0',
                      'sort_order': '0'})
    db.member_properties_skel.bulk_insert(prop_list)

if not db(db.auth_users.id > 0).count():
    sys_admin_role_id = db(db.auth_roles.role_name == 'SysAdmin').select(
        db.auth_roles.id)[0].id
    auth_alias = 'admin@qa-stack.com'
    # Create a temporary password, store it in our session and
    # notify the user that it NEEDS!! to be changed within the
    # session...
    auth_passwd = stackhelper.gen_pwd()
    user_temp_passwd = hash_pwd = hashlib.sha1(
        '%s%s' % (auth_alias, auth_passwd)).hexdigest()
    # Create our first user in the system and WARN the user
    # to change the password after FIRST log in...
    db.auth_users.insert(auth_alias=auth_alias,
                         auth_passwd=user_temp_passwd,
                         auth_role_id=sys_admin_role_id,
                         auth_created_on=request.now,
                         auth_modified_on=request.now,
                         is_enabled=True)

    # Stuff this info into the session, a bit of magic here since web2py
    # "provides" us with a session object in our environment
    session.RUN_ONCE = 1
    session.NEW_USER = auth_alias
    session.NEW_USER_PASSWD = auth_passwd
