#!/bin/bash

# Remove useless folders
rm -rf ~/Documents ~/Documents ~/examples.desktop ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

dconf write /org/gnome/desktop/notifications/show-in-lock-screen false
dconf write /org/gnome/desktop/notifications/show-banners false
dconf write /org/gnome/settings-daemon/plugins/power/ambient-enabled false
dconf write /org/gnome/desktop/interface/enable-animations false
dconf write /org/gnome/desktop/peripherals/mouse/accel-profile 'flat'
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/scrollback-unlimited true
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/scrollbar-policy 'never'
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/show-battery-percentage true
