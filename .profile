#alias ls='ls --color=auto'
alias psql-old='/usr/bin/psql'
alias psql='pgcli'
PS1='\[\033[00;32m\][\D{%d.%m %R}] \[\033[01;31m\]`__git_ps1 "%s "`\[\033[00m\]\[\033[01;32m\]\h\[\033[01;34m\] \w \$ \[\033[00m\]'
#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
PS2='> '
PS4='+ 'R=/usr/bin/vim

#alias gst='git-multi-status'
alias gst='git status'
alias ga='git add'
alias gci='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gha='git log --graph --date=relative --all --topo-order --pretty=format:'\''%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'\'''

alias pu="phing git-update"
alias puf="phing git-update-full"

alias ping="grc ping"
alias traceroute="grc traceroute"
alias make="grc make"
alias diff="grc diff"
alias cvs="grc cvs"
alias netstat="grc netstat"
alias ifconfig="grc ifconfig"
alias logc="grc cat"
alias logt="grc tail"
alias logh="grc head"

alias climb="composer outdated --outdated"

export EDITOR='vim'
export SVN_EDITOR=/usr/bin/vim
export PATH=$PATH:/opt/java/jre/bin/:/home/ereih/.gem/ruby/2.4.0/bin:${HOME}/.composer/vendor/bin:${HOME}/.config/composer/vendor/bin
export PYTHONSTARTUP=/home/ereih/.pystartup

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg[ \t]*:fg[ \t]*:history[ \t]*'
export HISTTIMEFORMAT='%d.%m.%y %T '
export PROMPT_COMMAND='history -a; printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

#. /usr/share/bash-completion/bash_completion
. /usr/local/etc/bash_completion
#. /usr/share/git/git-prompt.sh
#source ~/.git-prompt.sh
source ~/.kubectl-completion
source ~/.minikube-completion
