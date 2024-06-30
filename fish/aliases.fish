# `g co`, etc. subcommand expansion with `abbr`.
function subcommand_abbr
  set -l cmd "$argv[1]"
  set -l short "$argv[2]"
  set -l long "$argv[3]"

  # Check that these strings are safe, since we're going to eval.
  if not string match --regex --quiet '^[a-z]*$' "$short"
    or not string match --regex --quiet '^[a-z- ]*$' "$long"
    echo "Scary unsupported alias or expansion $short $long"; exit 1;
  end

  set -l abbr_temp_fn_name (string join "_" "abbr" "$cmd" "$short")
  # Subcommand arg expanesion via commandline -tokenize + abbr --position anywhere
  # thx lgarron for inspiration: https://github.com/lgarron/dotfiles/blob/2bc3e0282b/dotfiles/fish/.config/fish/abbr.fish & https://github.com/lgarron/dotfiles/blob/main/dotfiles/fish/.config/fish/dev.fish
  # https://www.reddit.com/r/fishshell/comments/16s0bsi/leveraging_abbr_for_git_aliases/
  set -l abbr_temp_fn "function $abbr_temp_fn_name
    set --local tokens (commandline --tokenize)
    if test \$tokens[1] = \"$cmd\"
      echo $long
    else
      echo $short
    end;
  end;
  abbr --add $short --position anywhere --function $abbr_temp_fn_name"
  eval "$abbr_temp_fn"
end

# ==========
# cd
# ==========
alias cd='z'
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# ==========
# fzf
# ==========
# fzf with preview
alias fp='fzf --preview "bat --color=always {}" --preview-window "~3"'

# fzf with tmux
alias ft='fzf --tmux 80%'

# fzf with preview and tmux
alias fpt='fzf --tmux 80% --preview "bat --color=always {}" --preview-window "~3"'

# cd with fzf
alias cf='cd (fd . -t d | ft)'

# bat with fzf
alias bf='bat (fpt)'

# ==========
# ls
# ==========
alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lla='eza -la'

# ==========
# others
# ==========
alias ps='procs'
alias grep='rg'
