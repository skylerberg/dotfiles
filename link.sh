#!/bin/bash

DOTFILES=".bashrc .emacs .gitconfig .gitignore .inputrc .pylintrc .tmux.conf .vimrc .vim .zshrc"
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


for FILE in $DOTFILES; do
	rm -rf $HOME/$FILE
	ln -s $SCRIPT_DIR/$FILE $HOME/$FILE
done

# Link to neovim config in $HOME/.config/nvim/init.vim
if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi
if [ ! -d $HOME/.config/nvim ]; then
	mkdir $HOME/.config/nvim
fi
if [ ! -e $HOME/.config/nvim/init.vim ]; then
	ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
fi

vim +PluginInstall +qall

# Setup YouCompleteMe plugin
pushd ~/.vim/bundle/YouCompleteMe
./install.py --go-completer --ts-completer --rust-completer --clang-completer
popd


# Link to mixxx config in $HOME/.mixxx/mixxx.cfg
if [ ! -d $HOME/.mixxx ]; then
	mkdir $HOME/.mixxx
fi
if [ ! -e $HOME/.mixxx/mixxx.cfg ]; then
	ln -s $SCRIPT_DIR/mixxx.cfg $HOME/.mixxx/mixxx.cfg
fi
