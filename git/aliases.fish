#!/usr/bin/env fish

# ==========
# git
# ==========
abbr g git
subcommand_abbr git cm "commit -m"
subcommand_abbr git co "checkout"
subcommand_abbr git a "add"
subcommand_abbr git s "status"
subcommand_abbr git r "reset --soft"
subcommand_abbr git d "diff"
subcommand_abbr git b "branch"
subcommand_abbr git f "fetch -p"
subcommand_abbr git m "merge"

alias tp="tmux popup -E -d '#{pane_current_path}' -w 80% -h 80% 'fish -c \"tig\"'"
