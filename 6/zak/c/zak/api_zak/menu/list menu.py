#Enter script code
stext = clipboard.get_selection()

choices = ["#", " = ", "#####################################","%s"]
wchoices = ["#", " = ", "#####################################","%s"]
ww = ["()", "[]","{}","<>","<''>","<"">"]

www = ["<a>", "<b>", "<i>", "<U>"]
wwww = ["<div>%s</div>","<tr>%s</tr>","<td>%s</td>"]

retCode, choice = dialog.list_menu(choices)
xchoice = 

if retCode == 0:
    keyboard.send_keys("You chose " + choice)
    