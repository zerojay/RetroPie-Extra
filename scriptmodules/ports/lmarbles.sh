#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lmarbles"
rp_module_desc="lmarbles - Open Source Atomix game"
rp_module_licence="GPL2 https://sourceforge.net/p/lgames/code/HEAD/tree/trunk/lmarbles/COPYING"
rp_module_section="exp"
rp_module_flags="!mali"
rp_module_sites=['http://lgames.sourceforge.net/LMarbles/']

function install_bin_lmarbles() {
     aptInstall lmarbles
}

function configure_lmarbles() {
    mkRomDir "ports"
    moveConfigFile "$home/.lgames/lmarbles.conf" "$md_conf_root/lmarbles/lmarbles.conf"
    addPort "$md_id" "lmarbles" "lmarbles - Open Source Atomix game" "/usr/games/lmarbles"
}
