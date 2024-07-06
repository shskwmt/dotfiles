# ==========
# docker
# ==========
abbr do docker
subcommand_abbr docker c "compose"
subcommand_abbr docker cl "compose logs"
subcommand_abbr docker ce "compose exec"
subcommand_abbr docker cr "compose run"
subcommand_abbr docker p "ps"

# lazydocker
alias ld="lazydocker"

# lazydocker with popup
alias ldp="tmux popup -E -d '#{pane_current_path}' -w 80% -h 80% 'fish -c \"ld\"'"
