#Enter script code
# IDE "helper" not part of the framework
import datetime
import hashlib
import base64

from gluon.contrib.login_methods.email_auth import email_auth
from gluon import *
from gluon.globals import *
from gluon.html import *
from gluon.http import *
from gluon.sqlhtml import SQLFORM, SQLTABLE, form_factory
session = Session()
request = Request()
response = Response()
# The following three lines are application-specific and used just so
# komodo (edit) (or even other IDEs sich as Wing) "finds" the methods
# for my classes, this does not have anyhing to do with the web2py
# framework itself, as I am already instantiating "auth_user",
# "stackhelper" etc in one of my models...
# from qastack.models import db
# from qastack.modules.CustomAuthentication import CustomAuthentication \
  #   as auth_user
# from qastack.modules.QAStackHelper import QAStackHelper as stackhelper