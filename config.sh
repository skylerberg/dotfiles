#!/bin/bash
set -x

# Remove useless folders
rm -rf ~/Documents ~/Documents ~/examples.desktop ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

dconf write /org/gnome/desktop/peripherals/mouse/accel-profile "'flat'"
dconf write /org/gnome/desktop/peripherals/touchpad/natural-scroll true
dconf write /org/gnome/desktop/sound/allow-volume-above-100-percent true
dconf write /org/gnome/desktop/interface/enable-animations false
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,close'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/terminal "['<Primary><Alt>t']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/www "['<Primary><Alt>f']"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-left "['<Super>Left']"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-right "['<Super>Right']"
dconf write /org/gnome/mutter/keybindings/maximize "['<Super>Up']"
dconf write /org/gnome/mutter/keybindings/switch-to-workspace-up "['<Primary><Alt>Up']"
dconf write /org/gnome/mutter/keybindings/switch-to-workspace-down "['<Primary><Alt>Down']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['<Primary><Alt>Right']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['<Primary><Alt>Left']"
dconf write /org/gnome/mutter/keybindings/move-to-workspace-up "['<Primary><Shift><Alt>Up']"
dconf write /org/gnome/mutter/keybindings/move-to-workspace-down "['<Primary><Shift><Alt>Down']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-right "['<Primary><Shift><Alt>Right']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-left "['<Primary><Shift><Alt>Left']"
dconf write /org/gnome/shell/app-switcher/current-workspace-only 'true'

dconf write /org/gnome/shell/extensions/wsmatrix/popup-timeout 400
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 16
dconf write /org/gnome/shell/extensions/wsmatrix/num-rows 4
dconf write /org/gnome/shell/extensions/wsmatrix/num-columns 4
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/show-battery-percentage true
dconf write /org/gnome/desktop/session/idle-delay 900
dconf write /org/gnome/desktop/wm/keybindings/close "['<Alt>F4']"

dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/scrollback-unlimited true
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/scrollbar-policy "'never'"
dconf write /org/gnome/desktop/notifications/show-in-lock-screen false
dconf write /org/gnome/desktop/notifications/show-banners false
dconf write /org/gnome/settings-daemon/plugins/power/ambient-enabled false
