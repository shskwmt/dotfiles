#!/usr/bin/env fish

alias e='emacsclient -a ""'
alias ef='emacsclient -a "" (fpt)'
alias ep="tmux popup -E -d '#{pane_current_path}' -w 70% -h 70% 'fish -c \"e (fp)\"'"
