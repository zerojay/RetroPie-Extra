#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="deadbeef"
rp_module_desc="deadbeef - Music Player"
rp_module_licence="MIT https://raw.githubusercontent.com/Alexey-Yakovenko/deadbeef/master/COPYING"
rp_module_help="If $md_id crashes back to emulationstation, it may be because the user you are running as does not have permission to launch X on its own. You can fix this by running 'dpkg-reconfigure x11-common' as root and then selecting $user or 'Anybody'."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.github.com/Alexey-Yakovenko/deadbeef']

function depends_deadbeef() {
    	getDepends git autopoint libtool intltool libgtk-3-dev libjansson-dev automake autoconf xdg-utils matchbox xorg xserver-xorg-legacy
}

function sources_deadbeef() {
        git clone https://github.com/Alexey-Yakovenko/deadbeef.git
}

function build_deadbeef() {
	cd "$md_build/deadbeef"
	./autogen.sh
	./configure --prefix="$md_inst"
	make
}

function install_deadbeef() {
        cd "$md_build/deadbeef"
	make install
}

function configure_deadbeef() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.config/$md_id" "$md_conf_root/$md_id"

    cat >"$md_inst/deadbeef.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
"$md_inst/bin/deadbeef"
_EOF_
    chmod +x "$md_inst/deadbeef.sh"

    addPort "$md_id" "deadbeef" "deadbeef - Music Player" "xinit $md_inst/deadbeef.sh"
}
