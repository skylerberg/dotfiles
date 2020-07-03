#!/bin/bash

sudo apt-get install -y git vim tmux redshift mixxx python-dev python3-dev python3-pip exuberant-ctags curl gnome-tweaks software-properties-common build-essential cmake python3-dev clang chrome-gnome-shell dconf-cli cmake fdfind

sudo apt-get install python-software-properties

# Install Neovim
if ! command -v nvim >/dev/null 2>&1; then
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	pip install neovim
fi

# Install Go
if ! command go >/dev/null 2>&1; then
	sudo add-apt-repository ppa:longsleep/golang-backports
	sudo apt-get update
	sudo apt-get install -y golang-go
fi

# Install Rust
if ! command -v rustup >/dev/null 2>&1; then
	curl https://sh.rustup.rs -sSf | sh
fi

# Install nodejs
if ! command -v node >/dev/null 2>&1; then
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	sudo apt-get install -y nodejs npm
	sudo apt-get install -y npm
fi

# Install solarized theme for terminal
if [! -d "/tmp/gnome-terminal-colors-solarized"]; then
	pushd /tmp
	git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
	pushd gnome-terminal-colors-solarized
	./install.sh
	popd
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
	curl -L git.io/antigen > ~/antigen.zsh
fi

if ! command -v rustup >/dev/null 2>&1; then 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# May as well do an upgrade while we are configuring the new system
sudo apt-get upgrade -y
