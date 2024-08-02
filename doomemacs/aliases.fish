#!/usr/bin/env fish

alias e='emacsclient -nw -c'
alias ef='emacsclient -nw -c (fpt)'
alias ep="tmux popup -E -d '#{pane_current_path}' -w 70% -h 70% 'fish -c \"e (fp)\"'"
