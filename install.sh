#!/bin/bash

sudo apt install -y git vim tmux redshift mixxx python-dev python3-dev python3-pip exuberant-ctags curl gnome-tweaks software-properties-common python-software-properties build-essential cmake python3-dev clang chrome-gnome-shell

# Install Neovim
if ! command -v nvim >/dev/null 2>&1; then
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt update
	sudo apt install -y neovim
	pip install neovim
fi

# Install Go
if ! command go >/dev/null 2>&1; then
	sudo add-apt-repository ppa:longsleep/golang-backports
	sudo apt update
	sudo apt install -y golang-go
fi

# Install Rust
if ! command -v rustup >/dev/null 2>&1; then
	curl https://sh.rustup.rs -sSf | sh
fi

# Install nodejs
if ! command -v node >/dev/null 2>&1; then
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	sudo apt-get install nodejs
fi

# Install solarized theme for terminal
if [! -d "/tmp/gnome-terminal-colors-solarized"]; then
	sudo apt install -y dconf-cli
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
	sudo apt -f install -y
	popd
fi

# Install zsh
if ! command -v zsh >/dev/null 2>&1; then
	sudo apt install -y zsh
	chsh -s `which zsh`
fi

curl -L git.io/antigen > ~/antigen.zsh

# May as well do an upgrade while we are configuring the new system
sudo apt upgrade -y
