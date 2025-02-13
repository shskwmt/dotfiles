#!/usr/bin/env bash

# setup homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export HOMEBREW_BUNDLE_FILE=~/.brewfile

# setup asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
