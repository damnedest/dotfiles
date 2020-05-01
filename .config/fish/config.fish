export LANGUAGE='en_US.UTF-8 git'

alias gst='git status'
alias ga='git add'
alias gci='git commit -m'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gha='git log --graph --date=relative --all --topo-order --pretty=format:'\''%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'\'''

alias psqld='psql -D d'
alias psqlk='psql -D k'

alias ls-old='/bin/ls'
alias ls='exa'

alias psql-old='/usr/bin/psql'
alias psql='pgcli'
alias gclean='git rm .gitattributes; git add -A; git reset --hard'

alias climb="composer outdated --outdated"

set -U HISTFILESIZE 1000000
set -U HISTSIZE 1000000
set -U HISTCONTROL ignoreboth
set -U HISTIGNORE 'ls:bg[ \t]*:fg[ \t]*:history[ \t]*'
set -U HISTTIMEFORMAT '%d.%m.%y %T '

set PATH $HOME/.composer/vendor/bin $HOME/go/bin ./vendor/bin ./node_modules/.bin $PATH

set fish_greeting ""

#function sync_history --on-event fish_preexec
#    history --save
#    history --merge
#end
function up-or-search -d "Depending on cursor position and current mode, either search backward or move up one line"
    # If we are already in search mode, continue
    if commandline --search-mode
        commandline -f history-search-backward
        return
    end

    # If we are navigating the pager, then up always navigates
    if commandline --paging-mode
        commandline -f up-line
        return
    end

    # We are not already in search mode.
    # If we are on the top line, start search mode,
    # otherwise move up
    set lineno (commandline -L)

    switch $lineno
        case 1
            commandline -f history-search-backward
            history merge # <-- ADDED THIS

        case '*'
            commandline -f up-line
    end
end

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
