DOTFILES_ROOT = $$(pwd)

YELLOW = $$(tput setaf 226)
RESET = $$(tput sgr0)

.PHONY: install
install: brew bash doomemacs tmux fish wsl

.PHONY: clean
clean:
	@printf "$(RED)--- clean -----------------------------------------------\n$(RESET)"
	show -t "$$HOME" -D bash
	show -t "$$HOME" -D doomemacs
	show -t "$$HOME" -D tmux

.PHONY: brew
brew:
	@printf "$(YELLOW)--- brew -----------------------------------------------\n$(RESET)"
	if [ -d "$$HOME/.linuxbrew" ]; then eval "$(~/.linuxbrew/bin/brew shellenv)"; fi
	if [ -d /home/linuxbrew/.linuxbrew ]; then eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"; fi
	if [ -f "$$HOME/.brewfile" ]; then rm "$$HOME/.brewfile"; fi
	ln -s "$(DOTFILES_ROOT)/homebrew/brewfile" "$$HOME/.brewfile"
	brew bundle --file "$$HOME/.brewfile"

.PHONY: bash
bash:
	@printf "$(YELLOW)--- bash -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" --ignore=".*\.bash" bash

.PHONY: doomemacs
doomemacs:
	@printf "$(YELLOW)--- doomemacs ------------------------------------------\n$(RESET)"
	stow -t "$$HOME" --ignore=".*\.bash" doomemacs

.PHONY: tmux
tmux:
	@printf "$(YELLOW)--- tmux -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" --ignore=".*\.bash" tmux

.PHONY: fish
fish:
	@printf "$(YELLOW)--- fish -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME/.config/fish" --ignore=".*\.bash" fish

.PHONY: wsl
wsl:
	@printf "$(YELLOW)--- wsl ------------------------------------------------\n$(RESET)"
	./script/setup_wsl.el
