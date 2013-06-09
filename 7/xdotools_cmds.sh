# commandlinefu.com by David Winterbottom

# Get mouse location (X,Y coordinates)
xdotool getmouselocation

# Automation click every 4 second on a macro slot bar to world of warcraft for prospecting item
while true; do sleep 4 ; xdotool click 1 ; done

# open new tab without  in gnome-terminal
WID=xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}' xdotool windowfocus $WID xdotool key ctrl+shift+t wmctrl -i -a $WID

# Mouse Tracking
while true; do xdotool getmouselocation | sed 's/x:\(.*\) y:\(.*\) screen:.*/\1, \2/' >> ./mouse-tracking; sleep 10; done

# Type a random string into a X11 window
sleep 3 && xdotool type --delay 0ms texthere

