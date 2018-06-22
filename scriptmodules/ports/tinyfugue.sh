#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="tinyfugue"
rp_module_desc="TinyFugue - Console MUD Client"
rp_module_licence="GPL2 https://raw.githubusercontent.com/kruton/tinyfugue/widechar/COPYING"
rp_module_help="If $md_id crashes back to emulationstation, it may be because the user you are running as does not have permission to launch X on its own. You can fix this by running 'dpkg-reconfigure x11-common' as root and then selecting $user or 'Anybody'."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.github.com/kruton/tinyfugue']

function depends_tinyfugue() {
    	getDepends xdg-utils matchbox xorg xserver-xorg-legacy
}

function install_bin_tinyfugue() {
        aptInstall tf
}

function configure_tinyfugue() {
    mkRomDir "ports"

    cat >"$romdir/ports/tinyfugue.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
xterm -rv /usr/games/tf
_EOF_
    chmod +x "$romdir/ports/tinyfugue.sh"

    addPort "$md_id" "tinyfugue" "TinyFugue - Console MUD Client" "xinit $romdir/ports/tinyfugue.sh"
}
