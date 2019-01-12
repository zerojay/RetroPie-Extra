#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="supertuxkart"
rp_module_desc="SuperTuxKart"
rp_module_licence="GPL3 https://sourceforge.net/p/supertuxkart/code/HEAD/tree/main/trunk/COPYING?format=raw"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_supertuxkart() {
    getDepends cmake xorg libxrandr-dev libssl-dev
}

function sources_supertuxkart() {
    if [ ! -f "/opt/retropie/supplementary/gl4es/libGL.so.1" ]; then
        gitPullOrClone "$md_build/gl4es" https://github.com/ptitSeb/gl4es.git
    fi
    gitPullOrClone "$md_build/$md_id" https://github.com/supertuxkart/stk-code.git
    cd $md_build
    svn co https://svn.code.sf.net/p/supertuxkart/code/stk-assets stk-assets
}

function build_supertuxkart() {
    if [ ! -f "/opt/retropie/supplementary/gl4es/libGL.so.1" ]; then
        cd "$md_build/gl4es"
        cmake . -DBCMHOST=1
        make -j3
    fi
    cd "$md_build/$md_id"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="$md_inst" -DUSE_FRIBIDI=0 -DUSE_GLES2=1 ..
    make -j2
    md_ret_require="$md_build/$md_id/build/bin/supertuxkart"
}

function install_supertuxkart() {
    if [ ! -f "/opt/retropie/supplementary/gl4es/libGL.so.1" ]; then
       mkdir -p /opt/retropie/supplementary/gl4es/
       cp "$md_build/gl4es/lib/libGL.so.1" /opt/retropie/supplementary/gl4es/
    fi
    cd "$md_build/$md_id/build/"
    make install
}

function configure_supertuxkart() {
    mkdir "ports"
    moveConfigDir "/root/.config/supertuxkart" "$md_conf_root/$md_id"
    addPort "$md_id" "supertuxkart" "SuperTuxKart" "sudo LD_LIBRARY_PATH=/opt/retropie/supplementary/gl4es:$md_inst/lib:$LD_LIBRARY_PATH LIBGL_FB=3 xinit $md_inst/bin/supertuxkart"
}
