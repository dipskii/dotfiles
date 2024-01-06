#!/usr/bin/bash

SOURCE=$(pamixer --list-sources | grep '"RODE NT-USB Analog Stereo"'| awk '{print $1}')
pamixer --source $SOURCE -t

if pamixer --source $SOURCE --get-mute | grep -q 'false'; then
  notify-send 'mic unmuted'
fi

if pamixer --source $SOURCE --get-mute | grep -q 'true'; then
  notify-send 'mic muted'
fi
