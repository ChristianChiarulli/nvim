#!/bin/env bash

#function for dependency check
dep_ch () {
	for dep; do
		if ! command -v "$dep" >/dev/null ; then
			echo "Program \"$dep\" not found. Please install it."
			exit
		fi
	done
}

# display error message in red to stderr
error () {
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

[ ! -d "$HOME/.config/nvim/neovim" ] || rm -rf ~/.config/nvim/neovim

#cloning latest neovim from official repo
git clone https://github.com/neovim/neovim.git ~/.config/nvim/neovim

#checks for file existance
[ -e /usr/local/bin/nvim ] && sudo rm -f /usr/local/bin/nvim
[ -e /usr/local/share/nvim/ ] && sudo rm -rf /usr/local/share/nvim/

cd "$HOME/.config/nvim/neovim" 2> /dev/null || terminate_script "Error: neovim directory not found exiting script ..."

make CMAKE_BUILD_TYPE=Release

sudo make install
cd "$CURRENT_DIR" || terminate_script "Error: not able to change directory to \"$CURRENT_DIR\""
rm -rf "$HOME/.config/nvim/neovim"
