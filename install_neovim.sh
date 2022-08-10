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
	printf "\33[2k\r\033[1;31m%s\033[0m\n" "$*" >&2
}

# display an informational message (first argument in green, second in magenta)
inf() {
	printf "\33[2K\r\033[1;35m%s \033[1;35m%s\033[0m\n" "$1" "$2"
}

#function to terminate script if error occur
terminate_script() {
	error "$*"
	exit 1
}

#provide dependency (space seperated)
dep_ch "gcc" "cmake" || true

CURRENT_DIR="$(pwd)"
NEOVIM_DIR="$HOME/.config/nvim/neovim"

#checks if neovim directory already exists
[ ! -d "$NEOVIM_DIR" ] || rm -rf "$NEOVIM_DIR"

# make a choice for build type
inf "" "Please choose a build type"
PS3='Please enter your choice: '
options=("Nightly" "Release (Default)" "exit script")
select opt in "${options[@]}"; do
	case $opt in
	"Nightly")
		BUILD_TYPE="$opt"
		break
		;;
	"Release (Default)")
		BUILD_TYPE="Release"
		break
		;;
	"exit script")
		exit 0
		;;
	*)
		BUILD_TYPE="Release"
		inf "[OK]" "Build type set to Release"
		break
		;;
	esac
done

#cloning latest neovim from official repo
git clone https://github.com/neovim/neovim.git "$NEOVIM_DIR"

#checks for file existance
[ -e /usr/local/bin/nvim ] && sudo rm -f /usr/local/bin/nvim
[ -e /usr/local/share/nvim/ ] && sudo rm -rf /usr/local/share/nvim/

cd "$NEOVIM_DIR" 2>/dev/null || terminate_script "Error: neovim directory not found exiting script ..."

make CMAKE_BUILD_TYPE="$BUILD_TYPE"

sudo make install
cd "$CURRENT_DIR" || terminate_script "Error: not able to change directory to \"$CURRENT_DIR\""
rm -rf "$NEOVIM_DIR"
