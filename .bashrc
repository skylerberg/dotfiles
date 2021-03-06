command_exists () {
  command -v $1 &> /dev/null;
}

if command_exists nvim ; then
  export EDITOR=nvim
  alias vim='nvim'
else
  export EDITOR=vim
fi

if command_exists synclient ; then
  synclient RightButtonAreaLeft=0
  synclient RightButtonAreaTop=0
fi

export PS1="\[\033[01;32m\]\u \[\033[01;31m\]\t\[\033[01;34m\] \w \$\[\033[00m\] "

alias fd=fdfind
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias update="sudo apt-get update && sudo apt-get -y upgrade"
alias ..="cd .."
alias red="redshift -O 3700"
alias blue="redshift -O 5500"
alias dark="sudo bash -c 'echo 1 > /sys/class/backlight/intel_backlight/brightness'"
brightness () {
	sudo bash -c "echo $1 > /sys/class/backlight/intel_backlight/brightness"
}

if command -v xsel &> /dev/null; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias vi='vim'
alias grep='grep --color=auto --exclude= "*.pyc"'

ls --color &> /dev/null
if [ $? -eq 0 ]; then
  alias ls='ls --color'
else
  alias ls='ls -G'
fi

alias l=ls
alias emacs='emacs -nw'
alias cow="sudo su postgres -c 'psql cow'"

alias pag='ps aux | grep'

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
source "$HOME/.cargo/env"
