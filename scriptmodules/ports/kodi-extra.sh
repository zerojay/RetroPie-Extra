#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="kodi-extra"
rp_module_desc="Kodi - Open source home theatre software"
rp_module_licence="GPL2 https://raw.githubusercontent.com/xbmc/xbmc/master/LICENSE.GPL"
rp_module_section="exp"
rp_module_flags="!mali"
rp_module_sites=['https://www.github.com/xbmc/xbmc/']

function depends_kodi-extra() {
    if isPlatform "rpi"; then
        if [[ "$__depends_mode" == "install" ]]; then
            # remove old repository
            rm -f /etc/apt/sources.list.d/mene.list
            echo "deb http://dl.bintray.com/pipplware/dists/jessie/main/binary/ ./" >/etc/apt/sources.list.d/pipplware.list
            wget -q -O- http://pipplware.pplware.pt/pipplware/key.asc | apt-key add - >/dev/null
        else
            rm -f /etc/apt/sources.list.d/pipplware.list
            apt-key del 4096R/BAA567BB >/dev/null
        fi
    fi
}

function install_bin_kodi-extra() {
    aptInstall kodi
}

function remove_kodi-extra() {
    aptRemove kodi
}

function configure_kodi-extra() {
    echo 'SUBSYSTEM=="input", GROUP="input", MODE="0660"' > /etc/udev/rules.d/99-input.rules

    mkRomDir "kodi"

    cat > "$romdir/kodi/Kodi.sh" << _EOF_
#!/bin/bash
/opt/retropie/supplementary/runcommand/runcommand.sh 0 "kodi-standalone" "kodi"
_EOF_

    chmod +x "$romdir/kodi/Kodi.sh"

    setESSystem 'Kodi' 'kodi' '~/RetroPie/roms/kodi' '.sh .SH' '%ROM%' 'pc' 'kodi'

    # Install some predefined joypad configurations
    gitPullOrClone "keymaps" https://github.com/HerbFargus/kodi-joypads.git
    cp -a keymaps/keymaps/ $home/.kodi/userdata/
    rm -R keymaps
    chown $user:$user -R $home/.kodi/userdata/keymaps 
}
