#!/usr/bin/python -O
# -*- coding: utf-8 -*-
#
# To-do list manager.
# Copyright (C) 2006-2010 MiKael NAVARRO
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

"""yaGTD
Copyright (C) 2006-2010 MiKael NAVARRO

A primitive Getting Things Done to-do list manager.
Cmd version: line oriented command interpreters.

"""

# Specific variables for pydoc
__author__ = "MiKael Navarro <klnavarro@gmail.com>"
__date__ = "July 2010"
__version__ = "0.3.4"

# Include directives
import os
import sys
import errno
import re
import datetime
from math import sqrt, log

import cmd

if __debug__: from pprint import pprint as pp

from gtd import Task, ToDo
import gtd

# Global variables
TODO_DIR    = "."
TODO_TXT    = TODO_DIR + "/todo.txt"
TODO_REST   = TODO_DIR + "/todo.rest"
TODO_TMP    = TODO_DIR + "/todo.tmp"
REPORT_TXT  = TODO_DIR + "/report.txt"
DONE_TXT    = TODO_DIR + "/done.txt"

FORMATTED_DISPLAY = True  # show task details or no?
USE_SHORTCUTS = False  # use all shortcuts or no?

# Colorization
COLOR_CODES = ( { 'none': "",
                  'default': "\033[0m",
                  # primary colors
                  'black': "\033[0;30m",
                  'grey': "\033[0;37m",
                  'red': "\033[0;31m",
                  'green': "\033[0;32m",
                  'blue': "\033[0;34m",
                  'purple': "\033[0;35m",
                  'cyan': "\033[0;36m",
                  'yellow': "\033[0;33m",
                  # bold colors
                  'white': "\033[1;37m",
                  'dark_grey': "\033[1;30m",
                  'dark_red': "\033[1;31m",
                  'dark_green': "\033[1;32m",
                  'dark_blue': "\033[1;34m",
                  'dark_purple': "\033[1;35m",
                  'dark_cyan': "\033[1;36m",
                  'dark_yellow': "\033[1;33m",
                  # other colors
                  'normal': "\x1b[0;37;40m",
                  'title': "\x1b[1;32;40m",
                  'heading': "\x1b[1;35;40m",
                  'bold': "\x1b[1;35;40m",
                  'important': "\x1b[1;31;40m",
                  'error': "\x1b[1;31;40m",
                  'reverse': "\x1b[0;7m",
                  'row0': "\x1b[0;35;40m",
                  'row1': "\x1b[0;36;40m" } )

# Default colors
DEFAULT_COLOR = COLOR_CODES['default']
CONTEXT_COLOR   = COLOR_CODES['dark_yellow']
PROJECT_COLOR   = COLOR_CODES['dark_purple']
STATUS_COLOR    = COLOR_CODES['dark_green']
REFERENCE_COLOR = COLOR_CODES['dark_blue']
URGENCY_COLOR    = COLOR_CODES['red']
IMPORTANCE_COLOR = COLOR_CODES['red']
COMPLETE_COLOR   = COLOR_CODES['white']
TIME_COLOR       = COLOR_CODES['cyan']
RECURRENCE_COLOR = COLOR_CODES['cyan']
START_COLOR      = COLOR_CODES['red']
DUE_COLOR        = COLOR_CODES['red']
END_COLOR        = COLOR_CODES['green']

# Regexps for parsing a task line
CONTEXT_CHAR   = "@"
PROJECT_CHAR   = "p:"
PROJECT_ALT    = "+"
STATUS_CHAR    = "!"
REFERENCE_CHAR = "ref:"
URGENCY_CHAR    = "U:"
IMPORTANCE_CHAR = "I:"
COMPLETE_CHAR   = "C:"
TIME_CHAR       = "T:"
RECURRENCE_CHAR = "R:"
START_CHAR      = "S:"
DUE_CHAR        = "D:"
END_CHAR        = "E:"

WORD_MATCH      = r"([_\w-]+)"
DIGIT_MATCH     = r"([1-5])"
NUMBER_MATCH    = r"(\d+)"
TIMEDELTA_MATCH = r"(\d+)([WDHM])"
DATE_MATCH      = r"(\d\d\d\d-\d\d-\d\d)"

DOW             = ["mo", "tu", "we", "th", "fr", "sa", "su"]
DOW_MATCH       = r"(" + "|".join (DOW) + ")"

CONTEXT_REGEXP   = re.compile(CONTEXT_CHAR + WORD_MATCH, re.IGNORECASE)
PROJECT_REGEXP   = re.compile("(?:" + PROJECT_CHAR
                              + "|" + "\\" + PROJECT_ALT + ")" + WORD_MATCH, re.IGNORECASE)
STATUS_REGEXP    = re.compile(STATUS_CHAR + WORD_MATCH, re.IGNORECASE)
REFERENCE_REGEXP = re.compile(REFERENCE_CHAR + WORD_MATCH, re.IGNORECASE)
URGENCY_REGEXP   = re.compile(URGENCY_CHAR + DIGIT_MATCH, re.IGNORECASE)
IMPORTANCE_REGEXP = re.compile(IMPORTANCE_CHAR + DIGIT_MATCH, re.IGNORECASE)
COMPLETE_REGEXP   = re.compile(COMPLETE_CHAR + NUMBER_MATCH, re.IGNORECASE)
TIME_REGEXP       = re.compile(TIME_CHAR + TIMEDELTA_MATCH, re.IGNORECASE)
RECURRENCE_REGEXP = re.compile(RECURRENCE_CHAR + TIMEDELTA_MATCH, re.IGNORECASE)
START_REGEXP      = re.compile(START_CHAR + DATE_MATCH, re.IGNORECASE)
DUE_REGEXP        = re.compile(DUE_CHAR + DATE_MATCH, re.IGNORECASE)
END_REGEXP        = re.compile(END_CHAR + DATE_MATCH, re.IGNORECASE)

START_DOW_REGEXP  = re.compile(START_CHAR + DOW_MATCH, re.IGNORECASE)
DUE_DOW_REGEXP    = re.compile(DUE_CHAR + DOW_MATCH, re.IGNORECASE)
END_DOW_REGEXP    = re.compile(END_CHAR + DOW_MATCH, re.IGNORECASE)

#
# Main GTD class.
#
class GTD(cmd.Cmd):
    """GTD(cmd.Cmd) class."""

    def __init__(self):
        cmd.Cmd.__init__(self)
        self.intro= """
  yaGTD is a free software available under the terms of the GNU GPL.
  Refer to the file COPYING (which should be included in this distribution)
  for the specific terms of this licence.
  """
        self.prompt = "GTD> "
        self.todo = ToDo()  # the to-do list is here!

        self.todotxt = TODO_TXT
        self.donetxt = DONE_TXT

        self.colorize = False
        self.tasks_selected = []

    #
    # Private functions.
    #

    def _parse_args(self, args):
        """Parse command arguments= num + str."""

        num = string = None

        # Parse command args
        n = re.search(r"^(?x)(\d+)", args)  # num
        s = re.search(r" +([@!:\+\-\w ]+)$", args)  # string

        if n: num = int(n.group(1))
        if s: string = s.group(1)

        #print "parsed", num, string
        return (num, string)

    def _parse_batch(self, args):  # BB
        """Return search criterion and elemenst to add/change."""

        regexp = action = ''
        try:
            regexp, action = args.split(' ', 1)
        except:
            pass
        return regexp, action

    def _colorize(self, string):
        """Colorize the given 'string'."""

        s = string

        if self.colorize:
            # Scan to colorize attributes (accordingly to global settings) ...
            for attr in Task.attributes_list[3:]:
                color_fct = lambda m: eval(attr.upper() + '_COLOR') + m.group(0) + DEFAULT_COLOR
                s = eval(attr.upper() + '_REGEXP').sub(color_fct, s)

        return s

    def _parse_line(self, line):
        """Return a dictionary (task mapping) from 'line' parsing."""

        t = {}  # Task mapping
        title = line  # the 'title' extracted from line

        # Parse for GTD attributes
        for attr in ['context', 'project', 'status', 'reference']:
            title = eval(attr.upper() + '_REGEXP').sub('', title)

            matches = eval(attr.upper() + '_REGEXP').findall(line)
            if matches:
                t[attr] = matches

        # Parse additional properties
        for attr in ['urgency', 'importance', 'complete']:
            title = eval(attr.upper() + '_REGEXP').sub('', title)

            matches = eval(attr.upper() + '_REGEXP').findall(line)
            if matches:
                t[attr] = int(matches[-1])  # keep only last!

        # Parse timedelta
        for attr in ['time', 'recurrence']:
            title = eval(attr.upper() + '_REGEXP').sub('', title)

            matches = eval(attr.upper() + '_REGEXP').findall(line)
            if matches:
                match = matches[-1]  # keep only last!
                hours = minutes = 0  # compute hours

                if attr == 'time':  # compute time requiered (in working hours)
                    if match[1].upper() == 'W':  # weeks
                        hours = int(match[0]) * gtd.WEEK_IN_HOURS
                    elif match[1].upper() == 'D':  # days
                        hours = int(match[0]) * gtd.DAY_IN_HOURS
                    elif match[1].upper() == 'H':  # hours
                        hours = int(match[0])
                    elif match[1].upper() == 'M':  # minutes
                        minutes = int(match[0])
                    else:
                        pass  # invalid time range indicator

                elif attr == 'recurrence':  # compute full hours
                    if match[1].upper() == 'W':  # weeks
                        hours = int(match[0]) * 7 * 24
                    elif match[1].upper() == 'D':  # days
                        hours = int(match[0]) * 24
                    elif match[1].upper() == 'H':  # hours
                        hours = int(match[0])
                    elif match[1].upper() == 'M':  # minutes
                        minutes = int(match[0])
                    else:
                        pass  # invalid time range indicator

                t[attr] = datetime.timedelta(hours= hours, minutes=minutes)

        # Parse dates
        for attr in ['start', 'due', 'end']:
            title = eval(attr.upper() + '_REGEXP').sub('', title)

            matches = eval(attr.upper() + '_REGEXP').findall(line)
            if matches:
                year, month, day = matches[-1].split('-')  # keep only last!
                t[attr] = datetime.datetime(int(year), int(month), int(day))

            else:  # check if it is in format of special day
                title = eval(attr.upper() + '_DOW_REGEXP').sub('', title)

                matches = eval(attr.upper() + '_DOW_REGEXP').findall(line)
                if matches:
                    today     = datetime.datetime.today()
                    today_dow = today.weekday()  # monday is first
                    given_dow = DOW.index(matches[-1])

                    day_diff = given_dow - today_dow
                    if day_diff < 0:
                        day_diff += 7;

                    day = today + datetime.timedelta (int (day_diff))
                    t[attr] = day

        # Post-processing
        if t.has_key('end') or t.has_key('reference'):  # ignore completed and archived tasks
            t['complete'] = 100

        # if due < start then correct due by setting it to start
        if t.has_key('due') and t.has_key('start'):
            if t['due'] < t['start']:
                t['due'] = t['start']

        # Set the title
        t['title'] = " ".join(title.split())  # remove useless blank chars too

        return t

    def _dump_line(self, task):
        """Return a formatted line from the given 'task'."""

        s = task['title']  # init the line with the title

        # Dump GTD attributes
        for attr in ['context', 'project', 'status', 'reference']:
            if task.has_key(attr):
                for value in task[attr]:
                    s += " " + eval(attr.upper() + '_CHAR') + value

        # Dump additional properties
        for attr in ['urgency', 'importance', 'complete']:
            if task.has_key(attr) and task[attr]:
                s += " " + eval(attr.upper() + '_CHAR') + str(task[attr])

        # Parse timedelta
        for attr in ['time', 'recurrence']:
            if task.has_key(attr) and task[attr]:
                hours = task[attr].days * 24 + task[attr].seconds / 3600
                if hours > 0:
                    s += " " + eval(attr.upper() + '_CHAR') + str(hours) + "H"
                else:  # less than 1 hour!
                    minutes = task[attr].seconds / 60
                    s += " " + eval(attr.upper() + '_CHAR') + str(minutes) + "M"

        # Parse dates
        for attr in ['start', 'due', 'end']:
            if task.has_key(attr) and task[attr]:
                s += " " + eval(attr.upper() + '_CHAR') + task[attr].strftime("%Y-%m-%d")

        return s

    def _disp(self, task):
        """Display the 'id' and a summary of the 'task'."""

        if FORMATTED_DISPLAY:
            task_line = self._dump_line(task)
        else:
            task_line = task['title']

        id_str = "%3d:(%f)" % (task['id'], task.priority())
        if self.colorize:  # colorize #id
            id_str = COLOR_CODES['cyan'] + id_str + DEFAULT_COLOR

        return "%s %s" % (id_str, self._colorize(task_line))

    def _show(self, task):
        """Display details of the given 'task'."""

        s = ""
        for attrib in Task.attributes_list[1:]:
            if task.has_key(attrib) and task[attrib]:
                if s: s = s + "\n"
                s = s + attrib.capitalize() + ": "
                if attrib == 'urgency':
                    s = s + str(gtd.URGENCY[task[attrib]])
                elif attrib == 'importance':
                    s = s + str(gtd.IMPORTANCE[task[attrib]])
                elif attrib == 'complete':
                    s = s + str(task[attrib]) + '%'
                else:
                    s = s + str(task[attrib])
        return s

    def _add(self, line):
        """Adds task from the given line and returns the new task_id."""

        if line:
            # Create the new task
            task = Task()

            # Parse input line for GTD and additional attributes
            task.add(**self._parse_line(line))

            # And, add it to the to-do list
            task_id = self.todo.add(task)

            # And, set the start date if none
            self.do_append("%d S:%s" % (task_id, datetime.datetime.now().strftime("%Y-%m-%d")))

            return task_id

    def _replace(self, idx, line):
        """Replace the task given by its idx by the new line."""

        # Frist, we need to find the task
        task = self.todo.find('id', idx)
        if task:
            i = self.todo.index(task)

            task = Task()  # create a new task

            # Parse input line for GTD and additional attributes
            task.add(**self._parse_line(line))
            task.add(id=idx)

            # And, replace it into the to-do list
            self.todo[i] = task

            # And, set the start date if none
            self.do_append("%d S:%s" % (idx, datetime.datetime.now().strftime("%Y-%m-%d")))

    def _search(self, regexp, completed=False, quiet=False):
        """Retrieve tasks matching given regexp.
        If completed True, also look for completed tasks."""

        # Rk: improved search function that retrieve regexp
        #     over all tasks attributes

        if completed:
            todos = [ t for t in self.todo.sort() ]  # first sort by priority
        else:
            todos = [ t for t in self.todo.sort() if t['complete'] < 100 ]

        # Then, retrieve the pattern (into full desc tasks)
        expr = re.compile(regexp, re.IGNORECASE)
        tasks = [ t for t in todos if expr.search(self._dump_line(t)) ]

        if not quiet:
            for t in tasks:
                print self._disp(t)

            # Show number of tasks as result of search if more than 10
            if len(tasks) > 10:
                print "%d tasks found" % len(tasks)

        # BB: This tiny line will be damn useful for further use...
        return tasks

    def _searchplus(self, regexp):  # BB
        """It searches, and returns the IDs."""

        lines = self._search(regexp, quiet=True)
        return [ line['id'] for line in lines ]

    def _get_deadlines_ordered(self):
        """Get tasks ordered by deadline, oldest first."""

        tasks = {}  # due -> task
        for task in self.todo:
            if not task['due'] or task['complete'] == 100:
                continue
            if not task['due'] in tasks:
                tasks[task['due']] = []
            tasks[task['due']].append(task)

        dues = tasks.keys()
        dues.sort()

        ordered = []

        for due in dues:
            ordered.extend(tasks[due])

        return ordered

    def _get_deadline_string(self, task):
        """Return formatted string of a deadline task."""

        now = datetime.datetime.now()
        daystart = datetime.datetime(year=now.year,
                                     month=now.month,
                                     day=now.day)
        dayend = daystart + datetime.timedelta(days=1)

        s = ""
        due = task.get('due', None)
        if due:
            left = due - daystart
            if due < daystart:
                days = -left.days
                if days == 1:
                    s = " [overdue one day]"
                else:
                    s = " [overdue %s days]" % days
            elif due < dayend:
                s = " [due today]"
            else:
                if left.days == 1:
                    s = " [one day left]"
                else:
                    s = " [%s days left]" % left.days

        return s

        s = ""
        due = task.get('due', None)
        if due:
            left = due - now
            if left < datetime.timedelta(days=1):
                s = " [due today]"
            elif left > datetime.timedelta(0):
                s = " [%s days left]" % left.days

    #
    # Edition.
    #

    def do_add(self, line):
        """Add a new task (from the input line):
        GTD> add My new task. @context p:Project"""

        task_id = self._add(line)
        if task_id:
            print "Task #%d added" % task_id

    do_a = do_add

    def do_del(self, id):
        """Delete given task:
        GTD> del #id"""

        # Parse command line
        idx = self._parse_args(id)[0]

        if idx:
            self.todo.supp(idx)
            print "Task #%d deleted" % idx

    do_rm = do_del

    def do_edit(self, id):
        """Interactively edit task given by #id:
        GTD> edit #id
        GTD edit> My task to edit. @context p:Project"""

        try:
            import readline
        except ImportError:
            print "Cannot edit without the 'readline' module!"
            return

        # Parse command line
        idx = self._parse_args(id)[0]

        if not idx:
            return

        task = self.todo.find('id', idx)
        if not task:
            return

        def pre_input_hook():
            readline.insert_text(self._dump_line(task))
            readline.redisplay()

            # Unset the hook again
            readline.set_pre_input_hook(None)

        readline.set_pre_input_hook(pre_input_hook)

        line = raw_input("GTD edit> ")
        # Remove edited line from history:
        #   oddly, get_history_item is 1-based,
        #   but remove_history_item is 0-based
        readline.remove_history_item(readline.get_current_history_length() - 1)
        self._replace(idx, line)
        print "Task #%d updated" % idx

    def do_close(self, id):
        """Close the given task:
        GTD> close #id"""

        # Parse command line
        idx = self._parse_args(id)[0]

        if idx:
            # First, we need to find the task
            task = self.todo.find('id', idx)
            if task:
                if task['recurrence']:
                    if not task['due']:
                        task['due'] = datetime.datetime.now()
                    task['start'] = task['start'] + task['recurrence']  # reinit start date
                    task['due'] = task['due'] + task['recurrence']
                    print "Task #%d (%s) rescheduled (%s)." % (idx, task['title'], task['due'])
                else:
                    task['end'] = datetime.datetime.now()
                    task['complete'] = 100
                    print "Task #%d (%s) completed." % (idx, task['title'])

    do_done = do_close
    do_do = do_close

    def do_replace(self, id_line):
        """Replace the entire task by a new one:
        GTD> replace #id My new task. @computer p:Project"""

        # Parse command line
        idx, line = self._parse_args(id_line)

        if idx and line:
            self._replace(idx, line)
            print "Task #%d replaced" % idx

    do_sub = do_replace

    def do_extend(self, id_desc):
        """Add more text (description) to task:
        GTD> extend #id Additional description."""

        # Parse command line
        idx, desc = self._parse_args(id_desc)

        if idx and desc:
            task = self.todo.find('id', idx)
            if task:
                task['title'] += " " + desc  # TODO: allow to attach additional notes
                print "Task #%d extended" % idx

    do_notes = do_extend

    def do_append(self, id_line):
        """Add new elements to task but leave existing elements unchanged:
        GTD> append #id @newcontext p:NewProject"""

        # Parse command line
        idx, line = self._parse_args(id_line)

        if idx and line:
            # Frist, we need to find the task
            task = self.todo.find('id', idx)
            if task:
                # Parse additional input line
                attrs = self._parse_line(line)

                # Then, modify the task
                task_modified = False
                for attr, value in attrs.items():
                    if value and not task[attr]:  # not override!
                        task[attr] = value
                        task_modified = True
                if task_modified:
                    print "Task #%d appended" % idx

    do_addto = do_append

    def do_appendall(self, args):  # BB
        """Add new elements to several tasks but leaves other elements unchanged:
        GTD> appendall regexp @newcontext p:NewProject"""

        regexp, action = self._parse_batch(args)

        tasks = self._searchplus(regexp)
        for taskid in tasks:
            self.do_append('%d %s' % (taskid, action))

    def do_modify(self, id_line):
        """Add/change elements of task but leave each other unchanged:
        GTD> modify #id @othercontext p:UpdtProject"""

        # Parse command line
        idx, line = self._parse_args(id_line)

        if idx and line:
            # First, we need to find the task
            task = self.todo.find('id', idx)
            if task:
                # Parse additional input line
                attrs = self._parse_line(line)

                # Then, modify the task
                task_modified = False
                for attr, value in attrs.items():
                    if value:  # override!
                        task[attr] = value
                        task_modified = True
                if task_modified:
                    print "Task #%d modified" % idx
            else:
                print "Please check the id of the task to modify."
        else:
            print "Please specify the id of the task to modify first."

    do_mod = do_modify

    def do_modifyall(self, args):  # BB
        """Add/change elements of several tasks but leave each other unchanged:
        GTD> modifyall regexp @othercontext p:UpdtProject"""

        regexp, action = self._parse_batch(args)

        tasks = self._searchplus(regexp)
        for taskid in tasks:
            self.do_modify('%d %s' % (taskid, action))

    #
    # Specific GTD commands.
    #

    def do_someday(self, id):
        """Mark the given task as !someday:
        GTD> someday #id"""

        # Parse command line
        idx = self._parse_args(id)[0]

        if idx:
            self.do_modify("%d %s" % (idx, "!someday"))

    do_maybe = do_someday

    def do_waitingfor(self, id):
        """Mark the given task as !waitingfor:
        GTD> waitingfor #id"""

        # Parse command line
        idx = self._parse_args(id)[0]

        if idx:
            self.do_modify("%d %s" % (idx, "!waitingfor"))

    def do_ref(self, id_ref):
        """Archive the given task as Reference:
        GTD> ref #id refname
        """

        # Parse command line
        idx, reference = self._parse_args(id_ref)

        if idx and reference:
            self.do_append("%d ref:%s" % (idx, reference))

    #
    # Additional options from Stephen Covey.
    #

    def do_urgency(self, id_level):
        """Set the Urgency (5=today, 4=this_week, 3=this_month, 2=this_quarter, 1=this_year):
        GTD> urgency #id lvl"""

        # Parse command line
        idx, level = self._parse_args(id_level)

        if idx and level and re.match(DIGIT_MATCH, level):
            self.do_modify("%d U:%d" % (idx, int(level)))

    do_u = do_urgency

    def do_importance(self, id_level):
        """Set the Importance (5=crucial,4=high,3=normal,2=low,1=someday):
        GTD> importance #id lvl"""

        # Parse command line
        idx, level = self._parse_args(id_level)

        if idx and level and re.match(DIGIT_MATCH, level):
            self.do_modify("%d I:%d" % (idx, int(level)))

    do_i = do_importance

    def do_complete(self, id_percent):
        """Set the percent complete:
        GTD> complete #id percentage"""

        # Parse command line
        idx, percent = self._parse_args(id_percent)

        if idx and percent and re.match(NUMBER_MATCH, percent):
            self.do_modify("%d C:%d" % (idx, int(percent)))

    do_c = do_complete

    def do_time(self, id_time):
        """Set the Time requiered to accomplish the task (in Weeks, Days, Hours or Minutes):
        GTD> time #id n[WDHM]"""

        # Parse command line
        idx, time = self._parse_args(id_time)

        if idx and time and re.match(TIMEDELTA_MATCH, time):
            self.do_modify("%d T:%s" % (idx, time))

    def do_recurrence(self, id_rec):
        """Set the Recurrence of the task (in Weeks, Days or Hours):
        GTD> recurrence #id n[WDH]"""

        # Parse command line
        idx, recurrence = self._parse_args(id_rec)

        if idx and recurrence and re.match(TIMEDELTA_MATCH, recurrence):
            self.do_modify("%d R:%s" % (idx, recurrence))

    do_recurs = do_recurrence
    do_rec = do_recurrence

    def do_start(self, id_date):
        """Set the Start / creation date:
        GTD> start #id YYYY-MM-DD"""

        # Parse command line
        idx, date = self._parse_args(id_date)

        if idx and date and re.match(DATE_MATCH, date):
            self.do_modify("%d S:%s" % (idx, date))

    def do_due(self, id_date):
        """Set the Due (target) date:
        GTD> due #id YYYY-MM-DD"""

        # Parse command line
        idx, date = self._parse_args(id_date)

        if idx and date and re.match(DATE_MATCH, date):
            self.do_modify("%d D:%s" % (idx, date))

    def do_duein(self, id_doff):
        """Set the Due (target) date in +/- days:
        GTD> duein #id +/-days"""

        # Parse command line
        idx, days_offset = self._parse_args(id_doff)

        if idx and days_offset:
            # Compute the new date= now + days_offset
            now = datetime.datetime.now()
            dayend = now + datetime.timedelta(int(days_offset))
            date = dayend.strftime("%Y-%m-%d")

            self.do_modify("%d D:%s" % (idx, date))

    def do_end(self, id_date):
        """Set the End, closure date:
        GTD> end #id YYYY-MM-DD"""

        # Parse command line
        idx, date = self._parse_args(id_date)

        if idx and date and re.match(DATE_MATCH, date):
            self.do_modify("%d E:%s" % (idx, date))

    #
    # Sorted/ordered display.
    #

    def do_listall(self, nb):
        """List #nb tasks (close or not and ordered by #id):
        GTD> listall [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = self.todo
        if nb:  # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d tasks found" % len(tasks)

    do_la = do_listall

    def do_list(self, nb):
        """List #nb open tasks (ordered by #id):
        GTD> list [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = [ t for t in self.todo if t['complete'] < 100 ]  # filter done/close tasks
        if nb:  # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d tasks found" % len(tasks)

    do_ls = do_list

    def do_listinbox(self, nb):
        """List #nb quick added tasks (i.e. without context; ordered by #id):
        GTD> listinbox [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = [ t for t in self.todo if t['complete'] < 100 and not t['context'] ]  # without context
        if nb:  # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d inbox tasks found" % len(tasks)

    do_li = do_listinbox

    def do_listref(self, nb):
        """List #nb ref tasks (ordered by #id):
        GTD> listref [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = [ t for t in self.todo if t.has_key('reference') and t['reference'] ]  # filter ref tasks
        if nb:  # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d references found" % len(tasks)

    do_lr = do_listref

    def do_show(self, id):
        """Show details of the given task:
        GTD> show #id"""

        # Parse command line
        idx = self._parse_args(id)[0]

        if idx:
            # Frist, we need to find the task
            task = self.todo.find('id', idx)
            if task:
                print self._show(task)

    do_view = do_show
    do_v = do_show

    def do_sort(self, nb):
        """Sort #nb tasks by priority (appear only after start date):
        GTD> sort [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = [ t for t in self.todo.sort() if t['complete'] < 100 ]

        # Appear only after start date
        today = datetime.datetime.now()
        tasks = [ t for t in tasks if t['start'] <= today ]

        if nb:  # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d tasks found" % len(tasks)

    def do_today(self, nb):
        """Sort #nb tasks by priority, and shows only today
        (the time now before and after start date):
        GTD> today [#nb]"""

        # Parse command line
        nb = self._parse_args(nb)[0]

        tasks = [ t for t in self.todo.sort() if t['complete'] < 100 ]

        # Appear only after start date
        today = datetime.datetime.now()
        tasks = [ t for t in tasks if t['start'] <= today ]

        if nb: # display only nb tasks
            tasks = tasks[:nb]

        for t in tasks:
            if t['due']:
                if t['due'] <= today:
                    print self._disp(t)
            else:
                print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d today tasks found" % len(tasks)

    do_now = do_today

    def do_listpri(self, regexp):
        """Sort tasks matching given regexp (appear only after start date):
        GTD> listpri [regexp]"""

        todos = [ t for t in self.todo.sort() if t['complete'] < 100 ]

        # Appear only after start date
        today = datetime.datetime.now()
        todos = [ t for t in todos if t['start'] <= today ]

        # Then, retrieve the pattern (into full desc tasks)
        expr = re.compile(regexp, re.IGNORECASE)
        tasks = [ t for t in todos if expr.search(self._dump_line(t)) ]

        for t in tasks:
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(tasks) > 10:
            print "%d tasks found" % len(tasks)

    do_lp = do_listpri

    def do_order(self, nb_attr):
        """Order #nb tasks by context/project/status/reference and priority
        (appear only after start date):
        GTD> order #nb [context|project|status|reference]"""

        # Parse command line
        nb, attr = self._parse_args(nb_attr)

        if not attr or attr not in ['context', 'project', 'status', 'reference']:
            attr = 'context'  # by default order by context

        for c, ts in self.todo.order(attr).items():
            if attr == 'reference':
                tasks = [ t for t in ts ]  # even if completed!
            else:
                tasks = [ t for t in ts if t['complete'] < 100 ]

            if not tasks: continue  # empty!

            # Appear only after start date
            today = datetime.datetime.now()
            tasks = [ t for t in tasks if t['start'] <= today ]

            # Section title
            print self._colorize(eval(attr.upper() + '_CHAR') + c.capitalize())

            if nb: tasks = tasks[:nb]  # display only nb tasks
            for t in tasks:
                print self._disp(t)

            # Show number of tasks as result of search if more than 10
            if len(tasks) > 10:
                print "%d tasks found" % len(tasks)

    do_o = do_order

    def do_status(self, line):
        """Display projects statuses (percent complete):
        GTD> status"""

        for p, ts in self.todo.order('project').items():
            # Thomas: don't show completed projects

            percent = 0  # compute project's percent complete
            next = ""
            for t in ts:
                if t['complete']:
                    percent += int(t['complete'])
                # Thomas: find next action
                if t['status'] and not t['complete'] and 'next' in t['status']:
                    next = " !next: %s" % t['title']

            percent /= len(ts)
            if percent == 100: continue

            # Section title
            print self._colorize(PROJECT_CHAR + p.capitalize()),
            print "%d%%%s" % (percent, self._colorize(next))

    do_summary = do_status

    def do_contexts(self, line):
        """Display contexts and next task for each context:
        GTD> contexts"""

        for context, tasks in self.todo.order('context').items():
            percent = 0  # compute project's percent complete
            count = 0
            next = None
            for t in tasks:
                print t['title'], t.priority(), t['complete']
                percent += int(t['complete'])
                if t['complete'] != 100:
                    print "->", t['title']
                    count += 1
                if not next and t['status'] and 'Next' in t['status'] and t['complete'] != 100:
                    next = t

            percent /= len(tasks)
            if percent == 100: continue

            # Section title
            print self._colorize(CONTEXT_CHAR + context) + ':',
            print "%d" % count,
            if next:
                projects = next['project']
                if projects:
                    print self._colorize(PROJECT_CHAR + projects[0]),
                print self._colorize("!Next: %s" % next['title'])
            else:
                print

    def do_deadlines(self, line):
        """Display upcoming tasks ordered by deadline:
        GTD> deadlines #nb"""

        # Parse command line
        nb = self._parse_args(line)[0]

        ordered = self._get_deadlines_ordered()

        # Keep only upcoming tasks
        now = datetime.datetime.now()
        daystart = datetime.datetime(year=now.year,
                                     month=now.month,
                                     day=now.day)
        dayend = daystart + datetime.timedelta(days=1)
        ordered = [t for t in ordered if t.get('due', None) >= daystart]

        if nb: ordered = ordered[:nb]  # display only nb tasks

        for t in ordered:
            # note about due
            s = self._get_deadline_string(t)

            print self._disp(t) + s

        # Show number of tasks as result of search if more than 10
        if len(ordered) > 10:
            print "%d due tasks found" % len(ordered)

    def do_overdue(self, line):
        """Display overdue tasks ordered by deadline (including due today):
        GTD> overdue #nb"""

        # Parse command line
        nb = self._parse_args(line)[0]

        ordered = self._get_deadlines_ordered()

        # Keep only overdue tasks
        now = datetime.datetime.now()
        daystart = datetime.datetime(year=now.year,
                                     month=now.month,
                                     day=now.day)
        dayend = daystart + datetime.timedelta(days=1)
        ordered = [t for t in ordered if t.get('due', None) < dayend]

        if nb: ordered = ordered[:nb]  # display only nb tasks

        for t in ordered:
            # note about due
            s = self._get_deadline_string(t)

            print self._disp(t) + s

        # Show number of tasks as result of search if more than 10
        if len(ordered) > 10:
            print "%d overdue tasks found" % len(ordered)

    #
    # Select/monitor.
    #

    def do_select(self, cmd):
        """ Select a task:
        GTD> select #id"""

        # Parse command line
        idx = self._parse_args(cmd)[0]

        task = self.todo.find('id', idx)
        if not task:
            print "Task not found"
            return

        self.tasks_selected.append(idx)

    def do_deselect(self, cmd):
        """ Deselect a task:
        GTD> deselect #id"""

        # Parse command line
        idx = self._parse_args(cmd)[0]

        if idx not in self.tasks_selected:
            print "Task not found"
            return

        self.tasks_selected.remove(idx)

    def do_selected(self, line=None):
        """Show selected tasks sorted by priority:
        GTD> selected"""

        for t in (self.todo.find("id", idx) for idx in self.tasks_selected):
            print self._disp(t)

        # Show number of tasks as result of search if more than 10
        if len(self.tasks_selected) > 10:
            print "%d selected tasks found" % len(self.tasks_selected)

    #
    # Re-search.
    #

    def do_search(self, regexp):
        """Retrieve tasks matching given regexp:
        GTD> search regexp"""

        self._search(regexp)

    do_s = do_search

    def do_searchall(self, regexp):
        """Retrieve tasks matching given regexp, including completed ones:
        GTD> searchall regexp"""

        self._search(regexp, completed=True)

    do_sa = do_searchall

    #
    # IO functions.
    #

    def do_load(self, todotxt):
        """Load from a todotxt file:
        GTD> load path/to/todo.txt"""

        self.todotxt = todotxt  # ok, save file path
        try:
            f = open(self.todotxt, 'r')
            try:
                self.todo.erase()  # clean
                nb = 0
                for line in f:
                    #print line,
                    if line.lstrip().startswith('#'): continue
                    self._add(line.strip())
                    nb += 1
            finally:
                f.close()
                print "%d tasks loaded from '%s'" % (nb, todotxt)
        except IOError, err:
            # 'file not found' exception?
            if err.errno != errno.ENOENT: raise  # raise all others
            print err  # and continue (new file created)

    do_l = do_load

    def do_save(self, todotxt):
        """Save to a todotxt file:
        GTD> save [path/to/todo.txt]"""

        if todotxt == "": todotxt = self.todotxt
        try:
            f = open(todotxt, 'w')
            try:
                for t in self.todo:
                    f.write(self._dump_line(t) + "\n")
            finally:
                f.close()
                print "%d tasks saved as '%s'" % (len(self.todo), todotxt)
        except IOError, err:
            print err  # and continue

    do_write = do_save
    do_w = do_save

    def do_archive(self, donetxt):
        """Archive completed tasks:
        GTD> archive [path/to/done.txt]"""

        if donetxt == "": donetxt = DONE_TXT

        # List done/close tasks
        done_lst = [ t for t in self.todo if t['complete'] >= 100 ]

        try:
            f = open(donetxt, 'w')
            try:
                for t in done_lst:
                    f.write(self._dump_line(t) + "\n")
                    self.todo.supp(t['id'])  # remove done/close tasks from current list
            finally:
                f.close()
                print "%d tasks archived as '%s'" % (len(done_lst), donetxt)
        except IOError, err:
            print err  # and continue

    def do_print(self, rest):
        """Export into printable format (ReST):
        GTD> print [path/to/todo.rest]"""

        if rest == "": rest = TODO_REST
        try:
            f = open(rest, 'w')
            try:
                sys.stdout = f  # a little trick

                # Header
                print "Getting Things Done to-do list manager"
                print "######################################"
                print
                print " ", "; ".join([__author__, __date__, __version__])
                print
                print ".. contents::"
                print

                prt_list = ( { 'name': "context",
                               'title': "contexts",
                               'char': CONTEXT_CHAR },
                             { 'name': "project",
                               'title': "projects",
                               'char': PROJECT_CHAR },
                             { 'name': "status",
                               'title': "statuses",
                               'char': STATUS_CHAR },
                             { 'name': "reference",
                               'title': "references",
                               'char': REFERENCE_CHAR },
                             )

                unprinted = self.todo[:]  # to detect unprinted tasks

                for attr in prt_list:
                    print attr['title'].capitalize()
                    print "=" * len(attr['title'])
                    print

                    for a, ts in self.todo.order(attr['name']).items():
                        attr_name = attr['char'] + a  # attr (full) name
                        print attr_name
                        print "-" * len(attr_name)
                        print

                        tasks = [ t for t in ts if t['complete'] < 100 ]
                        for t in tasks:  # task details
                            print "-", t['title']
                            try:  # ok, remove from unprinted list
                                unprinted.remove(t)
                            except ValueError:
                                pass
                        print
                    else:
                        #print ".."
                        print

                # No context, project, status and reference tasks
                unprinted = [t for t in unprinted if t['complete'] < 100]
                if unprinted:  # if some tasks left
                    print "Otherwise Unmentioned Open Tasks"
                    print "================================"
                    print

                    for t in unprinted:
                        print "-", t['title']
                    print

            finally:
                sys.stdout = sys.__stdout__  # restore stdout
                f.close()
                print "%d tasks exported to '%s'" % (len(self.todo), rest)  # okey

        except IOError, err:
            print err  # and continue

    #
    # Help/usage.
    #

    def do_usage(self, line=None):
        """Show language reference:
        GTD> usage"""

        print """Important commands:
    sort, order, list, listall, status
    edit, save
Options:
    U: urgency (5=today,4=this_week,3=this_month,2=this_quarter,1=this_year)
    I: importance (5=crucial,4=high,3=normal,2=low,1=someday)
    C: percent complete
    T: time required T:n[WDHM]
    R: recurrence R:n[WDH]
    S: start/creation date
    D: due (target) date
    E: end, closure date
    @context
    p:Project
    !status
    ref:reference
Type 'help' or '?' for more commands/options."""

    do_langref = do_usage

    #
    # Quit.
    #

    def do_EOF(self, line=None):
        """Quit."""

        print "bye"
        self.do_save("")  # auto save (default location)
        sys.exit()

    do_quit = do_EOF
    do_exit = do_EOF
    do_q = do_EOF

#
# Main entry point.
#
def main(options, todotxt=TODO_TXT, todoyaml=None):
    """A primitive Getting Things Done to-do list manager.
       Cmd version: line oriented command interpreters."""

    gtd_cmd = GTD()

    if todotxt:
        gtd_cmd.do_load(todotxt)
    elif todoyaml:
        gtd_cmd.do_import(todoyaml)

    if options and options.color:
        gtd_cmd.colorize = True

    if options.quiet:
        gtd_cmd.intro = ""

    try:
        # Enter the main cmdloop
        gtd_cmd.cmdloop()
    except KeyboardInterrupt:  # C^c
        print "bye"


#
# External entry point.
#
if __name__ == "__main__":
    # Get options
    from optparse import OptionParser, make_option

    option_list = [
        make_option("-c", "--color",
                    action="store_true", dest="color",
                    default=False,
                    help="activate color highlightment"),
        make_option( "-q", "--quiet",
                    action="store_true", dest="quiet",
                    help="do not print the copyright message")
        ]

    parser = OptionParser(usage="python -O %prog [options] todo.txt",
                          version=__version__,
                          description="A primitive Getting Things Done to-do list manager.",
                          option_list=option_list)

    (options, args) = parser.parse_args()

    # Needed argument
    if not args:
        parser.error("missing todo file argument")
    elif len(args) != 1:
        parser.error("incorrect number of arguments")

    # Process start here
    main(options, args[0])
