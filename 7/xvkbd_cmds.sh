# commandlinefu.com by David Winterbottom

# Press a key automatically
while true; do xvkbd -xsendevent -text "\[$KEY]" && sleep 2; done

# Typing the current date ( or any string ) via a shortcut as if the keys had been actually typed with the hardware keyboard in any application.
xvkbd -xsendevent -text $(date +%Y%m%d)

# Send keypresses to an X application
xvkbd -xsendevent -text "Hello world"

