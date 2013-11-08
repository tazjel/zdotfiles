# coding: utf8
# Provides a secure html/xhtml parser for the system
# Use from your controllers:
# text = parse_content(text)

import sgmllib
import re
import sys

IS_PYGMENTS = True

# TODO: Need to deal with ImportErrors in a more elegant manner
try:
    from pygments import highlight
    from pygments.lexers import PythonLexer
    from pygments.lexers import CSharpLexer
    from pygments.lexers import CLexer
    from pygments.lexers import CppLexer
    from pygments.lexers import JavaLexer
    from pygments.lexers import PhpLexer
    from pygments.formatters import HtmlFormatter
except ImportError:
    IS_PYGMENTS = False
    raise ValueError(sys.path)

class wStrippingParser(sgmllib.SGMLParser):
    # These are the HTML tags that we will leave intact
    valid_tags = ('a', 'b', 'i', 'u',)
    tolerate_missing_closing_tags = ('br',)
    from htmlentitydefs import entitydefs # replace entitydefs from sgmllib

    def __init__(self, mode):
        sgmllib.SGMLParser.__init__(self)
        self.result = []
        self.endTagList = []
        self.mode = mode

    def handle_data(self, data):
        self.result.append(data)

    def handle_charref(self, name):
        self.result.append("&#%s;" % name)

    def handle_entityref(self, name):
        x = ';' * self.entitydefs.has_key(name)
        self.result.append("&%s%s" % (name, x))

    def unknown_starttag(self, tag, attrs):
        """ Delete all tags except for legal ones. """
        if self.mode == "removeall":
            if tag in self.valid_tags:
                self.result.append('<' + tag)
                for k, v in attrs:
                    if k[0:2].lower() != 'on' and\
                       v[0:10].lower != 'javascript':
                        self.result.append(' %s="%s"' % (k, v))
                self.result.append('>')
                if tag not in self.tolerate_missing_closing_tags:
                    endTag = '</%s>' % tag
                    self.endTagList.insert(0, endTag)

    def unknown_endtag(self, tag):
        if self.mode == "removeall":
            if tag in self.valid_tags:
                # We don't ensure proper nesting of opening/closing tags
                endTag = '</%s>' % tag
                self.result.append(endTag)
                try:
                    self.endTagList.remove(endTag)
                except ValueError:
                    pass

    def cleanup(self):
        """ Append missing closing tags. """
        self.result.extend(self.endTagList)

    def get_html(self):
        html = ' '.join(self.result)
        return html


def handle_pygments(pat, content, pygments_lexer):
    if IS_PYGMENTS:
        data = pat.search(content)
        while data:
            code_found = highlight(data.group(2), pygments_lexer(),
                                   HtmlFormatter(noclasses=True));
            # This is needed to the global conversion to '<br />'s later on applies
            # to highlighted code as well.
            code_found = code_found.replace('<br />', '\n')
            if code_found.startswith('\n'):
                code_found = code_found[1:]
            if code_found.endswith('\n'):
                code_found = code_found[:-1]

            content = content[:data.start(0)] + code_found + content[data.end(0):]
            data = pat.search(content)
    else:
        content = '[PYGMENTS_ERROR] - %s' % content
    return content

def wparse_content(content, mode="removeall"):
    """ Parse the messages """
    if content.strip():
        parser = wStrippingParser(mode)
        new_content = content
        parser.feed(new_content)
        parser.close()
        parser.cleanup()
        clean_content = parser.get_html()
        clean_content = clean_content.replace('\r\n', '\n') # Remove Evil
        # At this point we already have the formatted html code, now
        # We need to take care of the syntax-highlighting
        # Pygments Lexers:
        # PythonLexer
        # CSharpLexer
        # CLexer
        # CppLexer
        # JavaLexer
        try:
            if clean_content.find('[code-python]') >= 0:
                pat = re.compile(r'(\[code-python\])(.*?)(\[/code-python\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, PythonLexer)
            if clean_content.find('[code-c#]') >= 0:
                pat = re.compile(r'(\[code-c#\])(.*?)(\[/code-c#\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, CSharpLexer)
            if clean_content.find('[code-c]') >= 0:
                pat = re.compile(r'(\[code-c\])(.*?)(\[/code-c\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, CLexer)
            if clean_content.find('[code-c++]') >= 0:
                pat = re.compile(r'(\[code-c\+\+\])(.*?)(\[/code-c\+\+\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, CppLexer)
            if clean_content.find('[code-java]') >= 0:
                pat = re.compile(r'(\[code-java\])(.*?)(\[/code-java\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, JavaLexer)
            if clean_content.find('[code-php]') >= 0:
                pat = re.compile(r'(\[code-php\])(.*?)(\[/code-php\])',
                                 re.DOTALL |  re.IGNORECASE | re.MULTILINE)
                clean_content = handle_pygments(pat, clean_content, PhpLexer)
            if clean_content.find('[code]') >= 0:
                clean_content = clean_content.replace('[code]', '<pre>')
                clean_content = clean_content.replace('[/code]', '</pre>')
        except NameError:
            # pygments not installed, return content as original text
            pass

    else:
        clean_content = ''
    clean_content = clean_content.replace('\n', '<br />')
    return clean_content

import sys, os, operator
import check_speech, policy_rules

# sys.argv.append("../_Report/src/main.tex") # For testing purpose...

#if __name__ == "__main__":
  #if len(sys.argv) < 2:
    #print("Usage: %s [option] <textfile>" % os.path.basename(sys.argv[0]))
    #print("")
    #print("  -h, --help  Show this help screen.")
    #print("")
    #sys.exit(-1)

#if sys.argv[1] == "--help" or sys.argv[1] == "-h":

print(getattr(check_speech, "__doc__"))
print("")
print("Policy rules")
print("============")
print("")

for Def in dir(policy_rules):
    Fun = getattr(policy_rules, Def)
    if callable(Fun) and Def.startswith("policy_"):
        print("%s: %s" % (Def, getattr(Fun, "__doc__")))
    sys.exit(0)

try:
    File = open("/home/ahmed/Dropbox/11_CAR.snip", "rb")
    FileContent = File.read()
    File.close()
except IOError:
    print("Could not open file!")
#print("%s: Could not open file!" % sys.argv[1])
sys.exit(-1)

Founds = []
for Def in dir(policy_rules):
    Fun = getattr(policy_rules, Def)
    if callable(Fun) and Def.startswith("policy_"):
        for RegExp in Fun():
            for Match in RegExp.finditer(FileContent):
                Line = FileContent.count("\n", 0, Match.start(0)) + 1
                Policy = Def.replace("policy_", "").replace("_", " ").capitalize()
                Pattern = RegExp.pattern
                Text = Match.group(0).replace(os.linesep, " ")
                Founds.append((Line, Policy, Pattern, Text))

Founds.sort(key=operator.itemgetter(0))
for Found in Founds:
    print("%4d %-18s ...%s..." % (Found[0], Found[1]+":", Found[3]))
