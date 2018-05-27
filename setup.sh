#!/bin/bash

DOTFILES=".bashrc .emacs .gitconfig .gitignore .inputrc .pylintrc .tmux.conf .vimrc .vim .zshrc"
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


for FILE in $DOTFILES; do
	rm -rf $HOME/$FILE
	ln -s $SCRIPT_DIR/$FILE $HOME/$FILE
done

if [ ! -e $HOME/.nvimrc ]; then
	ln -s $HOME/.vimrc $HOME/.nvimrc
fi

vim +PluginInstall +qall