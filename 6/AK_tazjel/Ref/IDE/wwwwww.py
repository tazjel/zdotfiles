#Enter script code
import re

# common variables

rawstr = r"""</snippets>"""
embedded_rawstr = r"""</snippets>"""


# 
matchstr = """<snippets namespace="" license="BSD" filetypes="yacas" authors="bani" name="English">
 <script></script>
 <item>
  <displayprefix></displayprefix>
  <match>Hello_eli</match>
  <displaypostfix></displaypostfix>
  <displayarguments></displayarguments>
  <fillin>Hello

I teach English in Saudi Arabia at the :
My scholarship provider is willing to grante my a scholarship for one year if I find the right English Langague Institute that would improve my English as a teacher.
Can you customize this year for me to improve my English langague and to improve my Teaching skills for English as a scond lanaguage?</fillin>
 </item>
</snippets>"""


# # # 

# method 1: using a compile object
# compile_obj = re.compile(rawstr)
# match_obj = compile_obj.search(matchstr)

# method 2: using search function (w/ external flags)
match_obj = re.search(rawstr, matchstr)

# method 3: using search function (w/ embedded flags)
# match_obj = re.search(embedded_rawstr, matchstr)

# # # 

newstr = compile_obj.subn('<item>
<displayprefix>
</displayprefix>
<match>Hello_eli</match>
<displaypostfix>
</displaypostfix>
<displayarguments>
</displayarguments>
<fillin>  wwww Hello
</fillin>
 </item>
</snippets>', 0)


# # # 
# keyboard.send_key(newstr)
# clipboard.fill_selection(newstr)

