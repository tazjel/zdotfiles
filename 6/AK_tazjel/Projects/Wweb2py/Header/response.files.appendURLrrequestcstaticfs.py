#Enter script code
import time
time.sleep(0.25)
text = clipboard.get_selection()

keyboard.send_key("<delete>")

# keyboard.send_keys("""{{response.files.append(URL(r=request,c=static,f='%s'))}}"""%text)

y = """{{response.files.append(URL(r=request,c=static,f='%s'))}}""" % text

# 
clipboard.fill_selection(y)
