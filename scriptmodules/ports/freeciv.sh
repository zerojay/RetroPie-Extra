#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="freeciv"
rp_module_desc="freeciv - Open Source Civilization game"
rp_module_licence="GPL2 https://raw.githubusercontent.com/freeciv/freeciv/master/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_freeciv() {
    # Using xorg/xinit fixes issue where game couldn't get past opening menu screen.
    getDepends xorg freeciv-sound-standard
}

function install_bin_freeciv() {
    
    aptInstall freeciv-client-sdl
}

function configure_freeciv() {
    mkRomDir "ports"
    moveConfigDir "$home/.freeciv" "$md_conf_root/freeciv"
    moveConfigFile "$home/.freeciv-client-rc-2.4" "$md_conf_root/freeciv"
    addPort "$md_id" "freeciv" "Freeciv" "xinit freeciv-sdl"
}
