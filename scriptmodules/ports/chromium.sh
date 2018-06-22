#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="chromium"
rp_module_desc="chromium - Open Source Web Browser"
rp_module_licence="MIT https://raw.githubusercontent.com/chromium/chromium/trunk/LICENSE"
rp_module_help="If Chromium crashes back to emulationstation, it may be because the user you are running as does not have permission to launch X on its own. You can fix this by running 'dpkg-reconfigure x11-common' as root and then selecting $user or 'Anybody'."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.github.com/chromium/chromium']

function depends_chromium() {
    if [[ "$__raspbian_ver" -lt 8 ]]; then
        getDepends git omxplayer libgnome-keyring-common libgnome-keyring0 libnspr4 libnss3 xdg-utils matchbox xserver-xorg-legacy xorg gconf-service libgconf-2-4
    else
        getDepends git omxplayer libgnome-keyring-common libgnome-keyring0 libnspr4 libnss3 xdg-utils matchbox xserver-xorg-legacy xorg gconf-service libgconf-2-4 rpi-chromium-mods
    fi
    
}

function sources_chromium() {
    if [[ "$__raspbian_ver" -lt 8 ]]; then
        apt-get install chromium-browser
    else
        wget http://ports.ubuntu.com/pool/universe/c/chromium-browser/chromium-browser-l10n_48.0.2564.82-0ubuntu0.15.04.1.1193_all.deb
        wget http://ports.ubuntu.com/pool/universe/c/chromium-browser/chromium-browser_48.0.2564.82-0ubuntu0.15.04.1.1193_armhf.deb
        wget http://ports.ubuntu.com/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_48.0.2564.82-0ubuntu0.15.04.1.1193_armhf.deb
    fi
}

function install_chromium() {
    if [[ "$__raspbian_ver" -lt 8 ]]; then
        sleep 1
    else
        dpkg -i "$md_build/chromium-codecs-ffmpeg-extra_48.0.2564.82-0ubuntu0.15.04.1.1193_armhf.deb"
        dpkg -i "$md_build/chromium-browser-l10n_48.0.2564.82-0ubuntu0.15.04.1.1193_all.deb" "$md_build/chromium-browser_48.0.2564.82-0ubuntu0.15.04.1.1193_armhf.deb"
    fi
}

function configure_chromium() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.config/$md_id" "$md_conf_root/$md_id"
    cat >"$md_inst/chromium.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/bin/chromium-browser
_EOF_
    chmod +x "$md_inst/chromium.sh"

    addPort "$md_id" "chromium" "Chromium - Open Source Web Browser" "xinit $md_inst/chromium.sh"
}
