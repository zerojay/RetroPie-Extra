#!/usr/bin/env bash
 
# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="freegish"
rp_module_desc="FreeGish - Gish Clone"
rp_module_menus="4+"
rp_module_flags="nobin !mali !x86"
 
function depends_freegish() {
    getDepends cmake xorg
}

function sources_freegish() {
    if [ ! -a "/opt/retropie/supplementary/glshim/libGL.so.1" ]; then
        gitPullOrClone "$md_build/glshim" https://github.com/ptitseb/glshim.git
    fi
}
 
function build_freegish() {
    cd "$md_build/glshim"
    cmake . -DBCMHOST=1
    make GL
}

function install_freegish() {
    aptInstall freegish
    if [ ! -a "/opt/retropie/supplementary/glshim/libGL.so.1" ]; then
       mkdir -p /opt/retropie/supplementary/glshim/
       cp "$md_build/glshim/lib/libGL.so.1" /opt/retropie/supplementary/glshim/
    fi
}
 
function configure_freegish() {
    mkdir "ports"
    moveConfigDir "$home/.freegish" "$md_conf_root/$md_id"
    addPort "$md_id" "freegish" "FreeGish - Gish Clone" "LD_LIBRARY_PATH=/opt/retropie/supplementary/glshim LIBGL_FB=1 xinit freegish"
}
