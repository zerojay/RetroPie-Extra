#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="firefox-esr"
rp_module_desc="FireFox-ESR - Formally known as IceWeasel, the Rebranded Firefox Web Browser"
rp_module_licence="MPL2 https://www.mozilla.org/media/MPL/2.0/index.815ca599c9df.txt"
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.mozilla.org/en-US/firefox/organizations/']

function depends_firefox-esr() {
    getDepends xorg matchbox xserver-xorg-legacy
}

function install_bin_firefox-esr() {
    aptInstall firefox-esr
}

function configure_firefox-esr() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.mozilla" "$md_conf_root/$md_id"
    cat >"$md_inst/firefox-esr.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/bin/firefox-esr
_EOF_
    chmod +x "$md_inst/firefox-esr.sh"
    
     addPort "$md_id" "firefox-esr" "FireFox-ESR - Formally known as IceWeasel, the Rebranded Firefox Web Browser" "xinit $md_inst/firefox-esr.sh"
}
