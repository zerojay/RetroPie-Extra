#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="texmaster2009"
rp_module_desc="Texmaster2009 - Tetris TGM Clone"
rp_module_licence="Unknown/Freeware"
rp_module_section="exp"
rp_module_flags="!x86 !mali"
rp_module_sites=['http://tetris.wikia.com/wiki/Texmaster']

function depends_texmaster2009() {
    getDepends wiringpi libsdl1.2-dev p7zip
}

function sources_texmaster2009() {
    wget -q http://zerojay.com/Texmaster2009-5.7z
    7zr x Texmaster2009-5.7z 
    #tar xvfz Texmaster2009.rpi1-ARMv6.tar.gz
    cd Texmaster2009
    tar xvfz Texmaster2009.rpi2-ARMv7.tar.gz
}

function install_bin_texmaster2009() {
    md_ret_files=(
      'Texmaster2009/data'
      'Texmaster2009/Texmaster2009'
      'Texmaster2009/Texmaster2009.ini'
      'Texmaster2009/Texmaster2009.nv'
      'Texmaster2009/Texmaster2009.sav'
      'Texmaster2009/index.html'
      'Texmaster2009/html'
    )

}

function configure_texmaster2009() {
    sudo chmod -R 777 "$md_inst/data/"
    sudo chmod 777 "$md_inst"/Texmaster2009.*
    addPort "$md_id" "texmaster" "Texmaster - Tetris TGM Clone" "pushd $md_inst; $md_inst/Texmaster2009; popd"
}
