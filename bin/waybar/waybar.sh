#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    echo "Waybar is running. Killing it..."
    pkill -x waybar
else
    echo "Waybar is not running. Starting it..."
    waybar &
fi

