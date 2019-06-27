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

antigen apply


bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '' history-incremental-search-backward
bindkey "^?" backward-delete-char

setopt no_hist_verify
setopt no_share_history

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
alias red="redshift -O 3700"
alias blue="redshift -O 5500"
alias dark="sudo bash -c 'echo 1 > /sys/class/backlight/intel_backlight/brightness'"
brightness () {
	sudo bash -c "echo $1 > /sys/class/backlight/intel_backlight/brightness"
}

if command_exists xsel; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias vi='vim'
alias grep='grep --color=auto'

ls --color &> /dev/null
if [ $? -eq 0 ]; then
  alias ls='ls --color'
else
  alias ls='ls -G'
fi

alias l=ls
alias emacs='emacs -nw'

alias gcb='git checkout -b'
alias gcane='git commit --amend --no-edit'
alias gau='git add -u'
alias ga='git add'
alias gc='git commit'
alias gpb='git push origin $(git branch | grep \* | cut -d " " -f2)'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'

alias python='python3'
alias pip='pip3'

alias uuid="python -c 'import uuid; print(uuid.uuid4())'"

function runner {
	while inotifywait --recursive -e close_write . &>/dev/null; do $($@); done
}

export PATH=$PATH:/home/skyler/.local/bin:/home/skyler/.cargo/bin

# added by travis gem
[ -f /home/skyler/.travis/travis.sh ] && source /home/skyler/.travis/travis.sh
