#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lgeneral"
rp_module_desc="lgeneral - Open Source strategy game"
rp_module_licence="GPL2 https://sourceforge.net/p/lgames/code/HEAD/tree/trunk/lgeneral/COPYING"
rp_module_section="exp"
rp_module_flags="!mali"
rp_module_sites=['http://lgames.sourceforge.net/LGeneral/']

function install_bin_lgeneral() {
     aptInstall lgeneral
}

function configure_lgeneral() {
    mkRomDir "ports"
    moveConfigFile "$home/.lgames/lgeneral.conf" "$md_conf_root/lgeneral/lgeneral.conf"
    addPort "$md_id" "lgeneral" "lgeneral - Open Source strategy game" "/usr/games/lgeneral"
}
