#!/bin/bash

DOTFILES=".bashrc .emacs .gitconfig .gitignore .inputrc .pylintrc .tmux.conf .vimrc .vim"
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


for FILE in $DOTFILES; do
	rm -f $HOME/$FILE
	ln -s $SCRIPT_DIR/$FILE $HOME/$FILE
done

ln -s $HOME/.vimrc $HOME/.nvimrc
