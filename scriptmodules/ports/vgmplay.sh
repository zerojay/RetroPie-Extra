#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="vgmplay"
rp_module_desc="vgmplay - Music Player"
rp_module_help="This application must be run from the command line. Add your .vgm and .vgz files to $home/vgm."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://github.com/vgmrips/vgmplay']

function depends_vgmplay() {
    	getDepends make gcc zlib1g-dev libao-dev
}

function sources_vgmplay() {
        git clone https://github.com/vgmrips/vgmplay.git
}

function build_vgmplay() {
	cd "$md_build/vgmplay/VGMPlay"
	make
        md_ret_require="$md_build/vgmplay/VGMPlay/vgmplay"
}

function install_vgmplay() {
    md_ret_files=(
        'vgmplay/VGMPlay/vgmplay'
        'vgmplay/VGMPlay/VGMPlay.ini'
    )
}

function configure_vgmplay() {
    mkdir -p "$home/vgm"
    moveConfigFile "$md_inst/VGMPlay.ini" "$md_conf_root/$md_id/VGMPlay.ini"

    addPort "$md_id" "vgmplay" "vgmplay - Music Player" "$md_inst/vgmplay"
}
