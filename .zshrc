# The following lines were added by compinstall
zstyle :compinstall filename '/home/skyler/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install

source ~/.zsh/antigen/antigen.zsh

antigen use oh-my-zsh

# bundels from oh-my-zsh
antigen bundle pip

# other bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen theme https://github.com/skylerberg/dotfiles.git themes/pygmalion


bindkey -v
bindkey -M viins 'jj' vi-cmd-mode


# adapted bashrc
command_exists () {
  command -v $1 &> /dev/null;
}

if command_exists nvim ; then
  export EDITOR=nvim
  alias vim='nvim'
else
  export EDITOR=vim
fi

alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias update="sudo apt-get update && sudo apt-get -y upgrade"
alias ..="cd .."

if command_exists xsel; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias grep='grep --color=auto'

ls --color &> /dev/null
if [ $? -eq 0 ]; then
  alias ls='ls --color'
else
  alias ls='ls -G'
fi

alias l=ls
alias emacs='emacs -nw'
