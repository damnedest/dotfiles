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

#'\[\033[00;32m\][\D{%d.%m %R}] \[\033[01;31m\]`__git_ps1 "%s "`\[\033[00m\]\[\033[01;32m\]\h\[\033[01;34m\] \w \$ \[\033[00m\]'

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
