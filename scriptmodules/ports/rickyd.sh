#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rickyd"
rp_module_desc="rickyd - Port of Rick Dangerous"
rp_module_licence="GPL https://sourceforge.net/p/rickyd/code/ci/master/tree/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !kms"
rp_module_sites=['https://sourceforge.net/projects/rickyd/']

function depends_rickyd() {
    getDepends libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev libsdl2-ttf-dev automake autoconf
}

function sources_rickyd() {
    gitPullOrClone "$md_build" https://git.code.sf.net/p/rickyd/code
}

function build_rickyd() {
    ./bootstrap.sh
    make distclean
    mkdir build
    cd build
    .././configure --prefix=$md_inst
    make
    md_ret_require="$md_build/build/sources/ricky"
}

function install_rickyd() {
    cd "$md_build/build"
    make install
}

function configure_rickyd() {
    moveConfigFile "$home/.rickrc" "$md_conf_root/rickyd/rickrc"
    addPort "$md_id" "rickyd" "Rickyd - Rick Dangerous clone" "$md_inst/bin/ricky"
}
