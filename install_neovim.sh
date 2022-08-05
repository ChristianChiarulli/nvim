#!/bin/env bash

#function for dependency check
dep_ch() {
	for dep; do
		if ! command -v "$dep" >/dev/null; then
			terminate_script "Program \"$dep\" not found. Please install it."
		fi
	done
}

# display error message in red to stderr
error() {
	print "\33[2k\r\033[1;31m%s\033[0m\n" "$*" >&2
}

#function to terminate script if error occur
terminate_script() {
	error "$*"
	exit 1
}

#provide dependency (space seperated)
dep_ch gcc cmake

CURRENT_DIR=$(pwd)
NEOVIM_DIR="$HOME/.config/nvim/neovim"

#checks if neovim directory already exists
[ ! -d "$NEOVIM_DIR" ] || rm -rf "$NEOVIM_DIR"

#cloning latest neovim from official repo
git clone https://github.com/neovim/neovim.git "$NEOVIM_DIR"

#checks for file existance
[ -e /usr/local/bin/nvim ] && sudo rm -f /usr/local/bin/nvim
[ -e /usr/local/share/nvim/ ] && sudo rm -rf /usr/local/share/nvim/

cd "$NEOVIM_DIR" 2>/dev/null || terminate_script "Error: neovim directory not found exiting script ..."

make CMAKE_BUILD_TYPE=Release

sudo make install
cd "$CURRENT_DIR" || terminate_script "Error: not able to change directory to \"$CURRENT_DIR\""
rm -rf "$NEOVIM_DIR"
