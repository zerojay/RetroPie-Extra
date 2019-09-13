#!/usr/bin/env bash

# psx2chd.sh
#
# RetroPie PSX2CHD
# A tool for compressing psx games into CHD format.
#
# Author: kashaiahyah85
# Repository: https://github.com/kashaiahyah85/RetroPie-psx2chd)
# License: MIT https://github.com/kashaiahyah85/RetroPie-psx2chd/blob/master/LICENSE)
#
# Requirements:
# - mame-tools

# Globals
# If the script is called via sudo, detect the user who called it and the homedir.
user="$SUDO_USER"
[[ -z "$user" ]] && user="$(id -un)"

home="$(eval echo ~$user)"

# Variables
readonly ROMS_DIR="/home/pi/RetroPie/roms/psx"
readonly SCRIPT_VERSION="0.1.0" # https://semver.org/
readonly SCRIPT_DIR="$(cd "$(dirname $0)" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_FULL="$SCRIPT_DIR/$SCRIPT_NAME"
readonly SCRIPT_TITLE="PSX2CHD"
readonly SCRIPT_DESCRIPTION="A tool for compressing PSX games into CHD format."
#readonly SCRIPTMODULE_DIR="/opt/retropie/supplementary/[SCRIPTMODULE_NAME]" # Uncomment if you want/need to use a scriptmoodule.
readonly DEPENDENCIES="mame-tools"
readonly GIT_REPO_URL="https://github.com/kashaiahyah85/RetroPie-psx2chd"
readonly GIT_SCRIPT_URL="https://github.com/kashaiahyah85/RetroPie-psx2chd/blob/master/psx2chd.sh"

# Dialogs
BACKTITLE="$SCRIPT_TITLE: $SCRIPT_DESCRIPTION"

# dialogYesNo example of usage:
#dialogYesNo "Do you want to continue?"
function dialogYesNo() {
    dialog --no-mouse --backtitle "$BACKTITLE" --yesno "$@" 15 75 2>&1 > /dev/tty
}

# dialogMsg example of usage
#dialogMsg "Failed to install package_name. Try again later."
function dialogMsg() {
    dialog --no-mouse --ok-label "OK" --backtitle "$BACKTITLE" --msgbox "$@" 20 70 2>&1 > /dev/tty
}

# dialogInfo example of usage:
# dialogInfo "Please wait. Compressing $PSX_ROM..."
function dialogInfo {
    dialog --infobox "$@" 8 50 2>&1 >/dev/tty
}

# end of dialog functions ###################################################


# Functions ##################################################################

function is_sudo() {
    [[ "$(id -u)" -eq 0 ]]
}

# Take care of deps

function check_dependencies() {
    local pkg
    for pkg in "${DEPENDENCIES[@]}";do
        if ! dpkg-query -W -f='${Status}' "$pkg" | awk '{print $3}' | grep -q "^installed$"; then
            echo "ERROR: The '$pkg' package is not installed!" >&2
            echo "Would you like to install it now?"
            local options=("Yes" "No")
            local option
            select option in "${options[@]}"; do
                case "$option" in
                    Yes)
                        if ! which apt-get > /dev/null; then
                            echo "ERROR: Can't install '$pkg' automatically. Try to install it manually." >&2
                            exit 1
                        else
                            sudo apt-get install "$pkg"
                            break
                        fi
                        ;;
                    No)
                        echo "ERROR: Can't launch the script if the '$pkg' package is not installed." >&2
                        exit 1
                        ;;
                    *)
                        echo "Invalid option. Choose a number between 1 and ${#options[@]}."
                        ;;
                esac
            done
        fi
    done
}

function compressRoms() {
	dialogMsg "This tool will compress any bin/cue psx roms."
	cd $ROMS_DIR
	for ROM in *.cue
	do
		FILE_IN=$(basename -- "$ROM" | grep .cue)
		FILE_OUT="${FILE_IN%.*}.chd"
		if ( -f $FILE_OUT )
		then
			mv "${FILE_in}" "${FILE_IN%.*}.cuebak"
			rm -f $FILE_IN
			exit 0
		fi
		cd $ROMS_DIR
		echo chdman createcd -i \"$FILE_IN\" -o \"$FILE_OUT\" > CHD_SCRIPT
		dialogInfo "Found \"${FILE_IN%.*}\"\n\n $(sh CHD_SCRIPT | grep \%)"
		dialogInfo "Found \"${FILE_IN%.*}\"\n\n Complete."
		rm -f CHD_SCRIPT
	done
}

function fixDiscNumbers() {
	cd $ROMS_DIR
	for OLD_NAME in $ROMS_DIR/*\(Disc\ [0-9]\).chd
	do
		dialogInfo "Fixing filenames for multi-disc games,\nPlease wait..."
		NEW_NAME="${OLD_NAME/\ \(Disc\ /.cd}"
		NEW_NAME="${NEW_NAME/\).chd/}"
		dialogInfo "Fixing $NEW_NAMEFixing\nPlease wait..."
		mv "$OLD_NAME" "${NEW_NAME}"
	done
}


function generateM3U() {
	cd $ROMS_DIR
	rm -f $ROMS_DIR/*.m3u
	for ROM_NAME in $ROMS_DIR/*.cd[0-9]
	do
		M3U_FILE="${ROM_NAME%.*}.m3u"
		dialogInfo "Generating M3Us ..."
		echo "\"$ROM_NAME\"" >> \
			"$M3U_FILE"
	done
}

function cleanUpCueBins() {
	cd $ROMS_DIR
	for CUE in $ROMS_DIR/*.cue
	do
		mv "$CUE" "${CUE%.*}.cuebak"
	done
	for BIN in $ROMS_DIR/*.bin
	do
		rm -f "$BIN"
	done
}

function fixGameListXML() {
	cd $ROMS_DIR
	cp $ROMS_DIR/gamelist.xml $ROMS_DIR/gamelist.xml.bak
	sed -e 's/\.cue/.chd/g' \
	    -e 's/\.PBP/.chd/g' \
	    -i $ROMS_DIR/gamelist.xml
}

function main() {
	check_dependencies
	#compressRoms
	fixDiscNumbers
	generateM3U
	cleanUpCueBins
	fixGameListXML
}

main