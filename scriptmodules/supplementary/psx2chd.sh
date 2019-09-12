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
# - RetroPie, any version.
# - mame-tools)

# Globals
# If the script is called via sudo, detect the user who called it and the homedir.
user="$SUDO_USER"
[[ -z "$user" ]] && user="$(id -un)"

home="$(eval echo ~$user)"

# Variables
readonly RP_DIR="$home/RetroPie"
readonly RP_CONFIG_DIR="/opt/retropie/configs"
readonly SCRIPT_VERSION="0.1.0" # https://semver.org/
readonly SCRIPT_DIR="$(cd "$(dirname $0)" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_FULL="$SCRIPT_DIR/$SCRIPT_NAME"
readonly SCRIPT_CFG="$SCRIPT_DIR/psx2chd.cfg" # Uncomment if you want/need to use a config file.
readonly SCRIPT_TITLE="PSX2CHD"
readonly SCRIPT_DESCRIPTION="A tool for compressing PSX games into CHD format."
#readonly SCRIPTMODULE_DIR="/opt/retropie/supplementary/[SCRIPTMODULE_NAME]" # Uncomment if you want/need to use a scriptmoodule.
readonly DEPENDENCIES=("mame-tools")
readonly ROMS_DIR="$RP_DIR/roms/psx"
readonly CHD_SCRIPT=$ROMS_DIR/chdscript.sh
readonly GIT_REPO_URL="https://github.com/kashaiahyah85/RetroPie-psx2chd"
#readonly GIT_SCRIPT_URL="[REPO_URL]/[path/to/script].sh

# Dialogs
BACKTITLE="$SCRIPT_DESCRIPTION"

# dialogMenu example of usage:
#options=( tag1 option1 tag2 option2 N optionN )
#dialogMenu "Text describing the options" "${options[@]}"
function dialogMenu() {
    local text="$1"
    shift
    dialog --no-mouse \
        --backtitle "$BACKTITLE" \
        --cancel-label "Back" \
        --ok-label "OK" \
        --menu "$text\n\nChoose an option." 17 75 10 "$@" \
        2>&1 > /dev/tty
}

# dialogMenuHelp example of usage:
#options=(1 option1 "Help message 1" 2 option2 "Help message 2" N optionN "Help message N")
#dialogMenuHelp "Text explaining the options" "${options[@]}"
function dialogMenuHelp() {
    local text="$1"
    shift
    dialog --no-mouse \
        --backtitle "$BACKTITLE" \
        --cancel-label "Back" \
        --ok-label "OK" \
        --item-help \
        --menu "$text\n\nChoose an option." 17 75 10 "$@" \
        2>&1 > /dev/tty
}

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
            dialogInfo  "ERROR: The '$pkg' package is not installed!\n\nAttempt to install $pkg now?" >&2
            local options=("Yes" "No")
            local option
            select option in "${options[@]}"; do
                case "$option" in
                    Yes)
                        if ! which apt-get > /dev/null; then
                            dialogMsg "ERROR: Can't install '$pkg' automatically. Try to install it manually." >&2
                            exit 1
                        else
                            sudo apt-get install "$pkg"
                            break
                        fi
                        ;;
                    No)
                        dialogMsg "ERROR: Can't launch the script if the '$pkg' package is not installed." >&2
                        exit 1
                        ;;
                    *)
                        dialogMsg "Invalid option. Choose a number between 1 and ${#options[@]}."
                        ;;
                esac
            done
        fi
    done
}

function cleanUp() {
    rm -f "$CHD_SCRIPT"
    clear
}

function fixNames() {
    cd $ROMS_DIR
    for OLD_NAME in "*\(Disc\ [0-9]\).chd"
    do
        dialogInfo "Fixing filenames for multi-disc games,\nPlease wait..."
        NEW_NAME="${OLD_NAME/\ \(Disc\ /.cd}"
        NEW_NAME="${NEW_NAME/\).chd/}"
        mv "$OLD_NAME" "${NEW_NAME}"
    done
}

function generateM3U() {
    cd $ROMS_DIR
    rm -f *.m3u
    dialog --title "Building M3Us" --gauge "Building ..." 10 75 < <(
        TOTAL=(*.cd[0-9])
        n=${#TOTAL[*]};
        t=0

        for ROM in *.cd[0-9]
        do
	    FILE_IN=$(basename -- "$ROM" |grep .*.cd)
	    FILE_M3U=${FILE_IN%.*}.m3u
	    PCT=$(( 100*(++t)/n ))
cat <<EOF
XXX
$PCT
Building M3U files for multi-disc games...  "$FILE_M3U"
XXX
EOF
	    echo "$FILE_IN" >> "$FILE_M3U" &>/dev/null
    done
    )
}

function compressRoms() {
    dialogMsg "This tool will compress any bin/cue psx roms."
    cd $ROMS_DIR
        for ROM in *.cue
        do
            FILE_IN=$(basename -- "$ROM" | grep .cue)
            FILE_OUT="${FILE_IN%.*}.chd"
	    cd $ROMS_DIR
	    echo chdman createcd -i \"${FILE_IN}\" -o \"${FILE_OUT}\" > $CHD_SCRIPT
	    sh "$CHD_SCRIPT" | dialog --progressbox "Compressing $FILE_OUT" 20 70
        done
}

function main() {
    check_dependencies
    #cleanUp
    compressRoms
    #fixNames
    generateM3U
    #cleanUp
    dialogMsg "Finished compressing roms, you may delete cues and bins."
}

main
exit 0
