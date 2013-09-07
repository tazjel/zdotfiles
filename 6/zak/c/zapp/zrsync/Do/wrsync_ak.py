#Enter script code

# command = 
system.exec_command("rsync -azv /home/bani/.config/autokey/data/ /home/bani/Dropbox/tools/kubuntu/autokey/ak_2013", getOutput=True)
winTitle = "rsync" 
winClass = "Done class"
# dialog.info_dialog("Window information","Active window information:\\nTitle: '%s'\\nClass: '%s'" % (winTitle, winClass))
# dialog.info_dialog(title="Information", message="rsync")
