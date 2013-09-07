# Persistent Value

# This script demonstrates 'remembering' a value in the store between separate invocations of the script.

if not store.has_key("runs"):
    # Create the value on the first run of the script
    store.set_value("runs", 'w'])
else:
    # Otherwise, get the current value and increment it
    cur = store.get_value("runs")
    # wcur = ','.join(cur)','. 
    # options = [x for x in wcur]
    # store.set_value("runs", cur + 1)
    
keyboard.send_keys("I've been run %d times!" % store.get_value("runs"))
# 