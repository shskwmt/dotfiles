# https://github.com/paulirish/dotfiles/blob/main/fish/aliases.fish#L33-L58
# `g co`, etc. subcommand expansion with `abbr`.
function fish_greeting
end

zoxide init fish | source
fzf --fish | source
starship init fish | source

source ~/.config/fish/aliases.fish

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.fish' -not -path '*.git*' -not -path '*fish/*.fish')
    source $src
end
