#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="zeldansq"
rp_module_desc="zeldansq - Zelda Navi's Quest fangame"
rp_module_licence="Unknown"
rp_module_help=""
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['http://www.zeldaroth.fr/']

function depends_zeldansq() {
    getDepends libsdl1.2-dev libsdl-gfx1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev unzip
}

function sources_zeldansq() {
    wget http://www.zeldaroth.fr/fichier/NSQ/linux/ZeldaNSQ-src-linux.zip
    unzip ZeldaNSQ-src-linux.zip
}

function build_zeldansq() {
    cd ZeldaNSQ-src-linux
    make
    md_ret_require="$md_build/ZeldaNSQ-src-linux/bin/Release/ZeldaNSQ"
}

function install_zeldansq() {
    md_ret_files=(
        'ZeldaNSQ-src-linux/bin/Release/ZeldaNSQ'
        'ZeldaNSQ-src-linux/data'
        'ZeldaNSQ-src-linux/config'
        'ZeldaNSQ-src-linux/saves'
    )
}

function configure_zeldansq() {
    mkRomDir "ports"
    chmod -R 777 "$md_inst/data"
    moveConfigDir "$md_inst/config" "$md_conf_root/$md_id/config"
    moveConfigDir "$md_inst/saves" "$md_conf_root/$md_id/saves"
    addPort "$md_id" "zeldansq" "zeldansq - Zelda Navi's Quest fangame" "pushd $md_inst; $md_inst/ZeldaNSQ; popd"
}
