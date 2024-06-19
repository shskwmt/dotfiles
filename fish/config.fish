for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.fish' -not -path '*.git*' -not -path '*fish/*.fish')
    source $src
end
