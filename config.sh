#!/bin/bash

# Get more workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 4

# Remove useless folders
rm -rf ~/Documents ~/Documents ~/examples.desktop ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
