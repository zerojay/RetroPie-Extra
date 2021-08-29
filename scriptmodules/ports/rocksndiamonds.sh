#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rocksndiamonds"
rp_module_desc="Rocks'n'Diamonds - Emerald Mine Clone"
rp_module_section="exp"
rp_module_flags="!mali"

function depends_rocksndiamonds() {
    getDepends libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev
#    getDepends libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev
}

function sources_rocksndiamonds() {
    git clone --branch master https://git.artsoft.org/rocksndiamonds.git "$md_build"
}

function build_rocksndiamonds() {
    make clean
    make
    md_ret_require="$md_build"
}

function install_rocksndiamonds() {
    md_ret_files=(
        'graphics'
        'levels'
        'music'
        'sounds'
        'COPYING'
        'CREDITS'
        'rocksndiamonds'
)
}

function configure_rocksndiamonds() {
    addPort "$md_id" "rocksndiamonds" "rocksndiamonds" "$md_inst/rocksndiamonds"

    mkRomDir "ports/rocksndiamonds"

    moveConfigDir "$home/.rocksndiamonds" "$md_conf_root/rocksndiamonds"
}
