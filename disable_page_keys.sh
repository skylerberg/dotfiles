#!/bin/bash
set -x

xmodmap -e 'keycode 112 = 0x0000' 
xmodmap -e 'keycode 117 = 0x0000' 
xmodmap -e 'clear lock'
xmodmap -e 'remove mod4 = Hyper_L'
xmodmap -e 'keycode 66 = Hyper_L'
xmodmap -e 'add Mod3 = Hyper_L'
