#!/usr/bin/env bash



# Terminate already running bar instances

# If all your bars have ipc enabled, you can use 

polybar-msg cmd quit

# Otherwise you can use the nuclear option:

# killall -q polybar



# Launch mainbar

echo "---" | tee -a /tmp/polybar1.log

polybar mainbar 2>&1 | tee -a /tmp/polybar1.log & disown



echo "Bar launched..."
