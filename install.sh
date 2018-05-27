#!/bin/bash

sudo apt-get install -y git vim tmux redshift

# Install Neovim
if ! command -v nvim >/dev/null 2>&1; then
	sudo apt-get install -y software-properties-common python-software-properties
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	pip install neovim
fi

# Install solarized theme for terminal
if ! command -v dconf >/dev/null 2>&1; then
	sudo apt-get install -y dconf-cli
	pushd /tmp
	git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
	cd gnome-terminal-colors-solarized
	./install.sh
	cd ..
	rm -rf gnome-terminal-colors-solarized
	popd
fi

# Install Google Chrome
if ! command -v google-chrome >/dev/null 2>&1; then
	pushd /tmp
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt-get -f install -y
	popd
fi

# Install zsh
if ! command -v zsh >/dev/null 2>&1; then
	sudo apt-get install -y zsh
	chsh -s `which zsh`
fi

# May as well do an upgrade while we are configuring the new system
sudo apt-get upgrade -y