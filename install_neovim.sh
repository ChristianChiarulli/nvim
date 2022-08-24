#!/bin/env bash

# Foreground colors
BLACK='\033[0;30m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

#Cursor Position control
# \33[2k -> erases the entire line your cursor is currently on
# \r -> brings your cursor to the beginning of the line
RESETLINE="\33[2k\r"

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
	printf "${RESETLINE} ${RED}%s${NC}\n" "$*" >&2
}

# display an informational message (first argument in green, second in yellow, third argument in magenta)
inf() {
	printf "$RESETLINE ${GREEN}%s${NC} ${YELLOW}%s${NC} ${MAGENTA}%s${NC}\n" "$1" "$2" "$3"
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
inf "" "" "Please choose a build type"
PS3='Please enter your choice: '
options=("Nightly" "Release (Default)" "exit script")
select opt in "${options[@]}"; do
	case "$opt" in
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
