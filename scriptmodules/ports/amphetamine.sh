#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="amphetamine"
rp_module_desc="amphetamine - 2D Platforming Game"
rp_module_help="This game requires a keyboard."
rp_module_licence="GPL2 https://www.gnu.org/licenses/gpl-2.0.txt"
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://libregamewiki.org/Amphetamine']

function install_bin_amphetamine() {
    aptInstall amphetamine amphetamine-data
}

function configure_amphetamine() {
    mkRomDir "ports"

    moveConfigDir "$home/.amph" "$md_conf_root/$md_id"
    addPort "$md_id" "amphetamine" "Amphetamine - 2D Platforming Game" "/usr/games/amphetamine"
}
