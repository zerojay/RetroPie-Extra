#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="maelstrom"
rp_module_desc="Maelstrom - Classic Mac Asteroids Remake"
rp_module_licence="GPL2 https://www.gnu.org/licenses/gpl-2.0.txt"
rp_module_section="exp"
rp_module_flags="!x86 !mali"
rp_module_sites=['https://www.libsdl.org/projects/Maelstrom/']

function depends_maelstrom() {
    getDepends libsdl1.2-dev libsdl-net1.2-dev
}

function sources_maelstrom() {
    wget https://www.libsdl.org/projects/Maelstrom/src/Maelstrom-3.0.6.tar.gz
    tar zxvf Maelstrom-3.0.6.tar.gz
}

function build_maelstrom() {
    cd Maelstrom-3.0.6
    ./autogen.sh
    ./configure
    automake --add-missing
    make
    md_ret_require="$md_build/Maelstrom-3.0.6/Maelstrom"
}

function install_maelstrom() {
    md_ret_files=(
       'Maelstrom-3.0.6/Images'
       'Maelstrom-3.0.6/Docs'
       'Maelstrom-3.0.6/Maelstrom_Fonts'
       'Maelstrom-3.0.6/Maelstrom_Sprites'
       'Maelstrom-3.0.6/Maelstrom_Sounds'
       'Maelstrom-3.0.6/Maelstrom-Scores'
       'Maelstrom-3.0.6/Maelstrom'
       'Maelstrom-3.0.6/icon.bmp'
    )
}

function configure_maelstrom() {
    mkRomDir "ports"
    moveConfigFile "$home/.Maelstrom-data" "$md_conf_root/$md_id"
    addPort "$md_id" "maelstrom" "Maelstrom - Classic Mac Asteroids Remake" "pushd $md_inst; ./Maelstrom; popd" 
}
