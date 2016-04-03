#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="kodi"
rp_module_desc="Kodi - Open source home theatre software"
rp_module_menus="4+"
rp_module_flags="nobin !mali"

function depends_kodi() {
 # add repository to install Kodi 16 (Jarvis)
    echo "deb http://pipplware.pplware.pt/pipplware/dists/jessie/main/binary /" > /etc/apt/sources.list.d/pipplware_jessie.list
    wget -O - http://pipplware.pplware.pt/pipplware/key.asc | sudo apt-key add -
}

function install_kodi() {
    # remove old repository - we will use Kodi from the Raspbian repositories
    rm -f /etc/apt/sources.list.d/mene.list
    aptInstall kodi
}

function configure_kodi() {
    echo 'SUBSYSTEM=="input", GROUP="input", MODE="0660"' > /etc/udev/rules.d/99-input.rules

    mkRomDir "kodi"

    cat > "$romdir/kodi/Kodi.sh" << _EOF_
#!/bin/bash
/opt/retropie/supplementary/runcommand/runcommand.sh 0 "kodi-standalone" "kodi"
_EOF_

    chmod +x "$romdir/kodi/Kodi.sh"

    # remove the repo so it doesnt conflict with other repositories
    rm /etc/apt/sources.list.d/pipplware_jessie.list

    setESSystem 'Kodi' 'kodi' '~/RetroPie/roms/kodi' '.sh .SH' '%ROM%' 'pc' 'kodi'
}
