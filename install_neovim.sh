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

#provide dependency (space seperated)
dep_ch cmake

#cloning latest neovim from official repo
git clone https://github.com/neovim/neovim.git ~/.config/nvim/neovim

#checks for file existance
[ -e /usr/local/bin/nvim ] && sudo rm /usr/local/bin/nvim
[ -e /usr/local/share/nvim/ ] && sudo rm -r /usr/local/share/nvim/

cd ~/.config/nvim/neovim 2> /dev/null || echo "Error: neovim directory not found exiting script ..." && exit

make CMAKE_BUILD_TYPE=Release

sudo make install

rm -rf ~/.config/nvim/neovim
