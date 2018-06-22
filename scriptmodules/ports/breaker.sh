#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="breaker"
rp_module_desc="breaker - Arkanoid Clone"
rp_module_licence="GPL2 https://ayera.dl.sourceforge.net/project/breaker10/source/GNU-GPL-2.0.txt"
rp_module_section="exp"
rp_module_flags="!x86 !mali"
rp_module_sites=['https://sourceforge.net/projects/breaker10/']

function depends_breaker() {
    getDepends libsdl2-dev unzip
}

function sources_breaker() {
    wget -O- -q http://oldschoolprg.x10.mx/downloads/_sf_breaker_215.tar.gz | tar -xvz
}

function build_breaker() {
  cd "$md_build/source"
  sed -i "s/-lSDL/-lSDL -lm/" "$md_build/source/Makefile"
  make
  md_ret_require="$md_build/source/breaker"
}

function install_breaker() {
    md_ret_files=(
	'source/breaker'
	'source/gfx'
    )
}

function configure_breaker() {
    mkRomDir "ports"
    addPort "$md_id" "breaker" "breaker - Arkanoid Clone" "pushd $md_inst; ./breaker; popd"
}
