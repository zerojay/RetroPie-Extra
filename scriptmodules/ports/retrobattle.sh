#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="retrobattle"
rp_module_desc="retrobattle - Fun Retro Style Game"
rp_module_licence="GPL2 https://www.gnu.org/licenses/gpl-2.0.txt"
rp_module_help="If $md_id crashes back to emulationstation, it may be because the user you are running as does not have permission to launch X on its own. You can fix this by running 'dpkg-reconfigure x11-common' as root and then selecting $user or 'Anybody'."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['http://remar.se/andreas/retrobattle/']

function depends_retrobattle() {
    	getDepends libsdl1.2-dev libsdl-mixer1.2-dev xdg-utils matchbox xorg xserver-xorg-legacy
}

function sources_retrobattle() {
        wget -O- -q http://remar.se/andreas/retrobattle/files/retrobattle-src-1.0.0.tar.bz2 | tar -xvj --strip-components=1
        sed -i 's/WIDTH = 800/WIDTH = 1280/' "$md_build/src/retro.cc"
        sed -i 's/HEIGHT = 600/HEIGHT = 720/' "$md_build/src/retro.cc"
        sed -i 's/FS = 0/FS = 1/' "$md_build/src/retro.cc"
}

function build_retrobattle() {
	cd "$md_build/src/"
	make
        md_ret_require="$md_build/retrobattle"
}

function install_retrobattle() {
        md_ret_files=(
             'data/'
             'retrobattle'
        )
}

function configure_retrobattle() {
    mkRomDir "ports"
    mkdir -p "$md_inst"

    cat >"$md_inst/retrobattle.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
"$md_inst/retrobattle"
_EOF_
    chmod +x "$md_inst/retrobattle.sh"

    addPort "$md_id" "retrobattle" "retrobattle" "xinit $md_inst/retrobattle.sh"
}
