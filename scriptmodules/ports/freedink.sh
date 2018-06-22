#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="freedink"
rp_module_desc="FreeDink - Dink Smallwood Engine"
rp_module_licence="GPL3 http://git.savannah.gnu.org/cgit/freedink.git/plain/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.gnu.org/software/freedink/']

function depends_freedink() {
    getDepends xorg xserver-xorg-legacy
}

function install_bin_freedink() {
    aptInstall freedink
}

function configure_freedink() {
    mkRomDir "ports"
    moveConfigDir "$home/.dink" "$md_conf_root/$md_id"

    addPort "$md_id" "freedink" "FreeDink - Dink Smallwood Engine" "xinit freedink"
}
