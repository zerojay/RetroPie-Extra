#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="weechat"
rp_module_desc="Weechat - Console IRC Client"
rp_module_licence="GPL3 https://raw.githubusercontent.com/weechat/weechat/master/COPYING"
rp_module_help="If $md_id crashes back to emulationstation, it may be because the user you are running as does not have permission to launch X on its own. You can fix this by running 'dpkg-reconfigure x11-common' as root and then selecting $user or 'Anybody'."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.github.com/weechat/weechat']

function depends_weechat() {
    	getDepends xdg-utils matchbox xorg xserver-xorg-legacy
}

function install_bin_weechat() {
        aptInstall weechat
}

function configure_weechat() {
    mkRomDir "ports"
    moveConfigDir "$home/.weechat" "$md_conf_root/weechat"

    cat >"$romdir/ports/weechat.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
xterm -rv /usr/bin/weechat
_EOF_
    chmod +x "$romdir/ports/weechat.sh"

    addPort "$md_id" "weechat" "Weechat - Console IRC Client" "xinit $romdir/ports/weechat.sh"
}
