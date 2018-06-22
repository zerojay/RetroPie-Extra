#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lbreakout2"
rp_module_desc="lbreakout2 - Open Source Breakout game"
rp_module_licence="GPL2 https://sourceforge.net/p/lgames/code/HEAD/tree/trunk/lbreakout2/COPYING"
rp_module_section="exp"
rp_module_flags="!mali"
rp_module_sites=['http://lgames.sourceforge.net/LBreakout2/']

function install_bin_lbreakout2() {
    
    aptInstall lbreakout2
}

function configure_lbreakout2() {
    mkRomDir "ports"
    moveConfigFile "$home/.lgames/lbreakout2.conf" "$md_conf_root/lbreakout2/lbreakout2.conf"
    addPort "$md_id" "lbreakout2" "lbreakout2 - Open Source Breakout game" "/usr/games/lbreakout2"
}
