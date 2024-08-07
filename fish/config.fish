# https://github.com/paulirish/dotfiles/blob/main/fish/aliases.fish#L33-L58
# `g co`, etc. subcommand expansion with `abbr`.
function fish_greeting
end

fish_config theme choose 'Catppuccin Mocha'

status --is-interactive; and rbenv init - --no-rehash fish | source
zoxide init fish | source
fzf --fish | source
starship init fish | source

source ~/.config/fish/aliases.fish

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.fish' -not -path '*.git*' -not -path '*fish/*.fish')
  source $src
end

if test -e ~/.local.fish
  source ~/.local.fish
end
