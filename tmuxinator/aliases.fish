#!/usr/bin/env fish

alias mux='tmuxinator'
alias ms='set wpath (fd --full-path ~ -t d | ft) && tmuxinator start project -n (echo $wpath | rev | cut -d "/" -f 2 | rev) "$HOME/$wpath"'
