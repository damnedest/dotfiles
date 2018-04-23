alias gst='git status'
alias ga='git add'
alias gci='git commit -m'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gha='git log --graph --date=relative --all --topo-order --pretty=format:'\''%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'\'''

alias pu="phing git-update"
alias puf="phing git-update-full"

alias psql-old='/usr/bin/psql'
alias psql='pgcli'

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

set -U HISTFILESIZE 1000000
set -U HISTSIZE 1000000
set -U HISTCONTROL ignoreboth
set -U HISTIGNORE 'ls:bg[ \t]*:fg[ \t]*:history[ \t]*'
set -U HISTTIMEFORMAT '%d.%m.%y %T '

set PATH $HOME/.composer/vendor/bin ./vendor/bin $PATH

set fish_greeting ""

function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set -l current_time (date '+%d.%m %R')

    set_color green
    echo -ne '['
    echo -ne "$current_time"
    echo -ne ']'
    set_color normal

    if test "$git_branch" != ''
       set_color red
       echo -ne " $git_branch"
       set_color normal
    end

    echo -ne ' '
    set_color blue
    echo -n (prompt_pwd)
    echo -ne ' '
    echo -ne '$ '
    set color normal
end
