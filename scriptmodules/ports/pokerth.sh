#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="pokerth"
rp_module_desc="PokerTH - Poker-engine for the famous Texas Holdem Poker"
rp_module_licence="AGPL-3.0 https://raw.githubusercontent.com/pokerth/pokerth/stable/COPYING"
rp_module_section="exp"
rp_module_flags=""

function depends_pokerth() {
    getDepends xorg matchbox
}

function install_bin_pokerth() {
    aptInstall pokerth
}

function configure_pokerth() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.pokerth" "$md_conf_root/$md_id"
    cat >"$md_inst/pokerth.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/games/pokerth
_EOF_
    chmod +x "$md_inst/pokerth.sh"
    
    addPort "$md_id" "pokerth" "PokerTH" "xinit $md_inst/pokerth.sh"
}
