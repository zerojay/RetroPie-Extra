#!/usr/bin/env bash

#
# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="gearboy"
rp_module_desc="Gearboy - Gameboy & Gameboy Color Emulator"
rp_module_licence="GPL3 https://raw.githubusercontent.com/drhelius/Gearboy/master/LICENSE"
rp_module_section="exp"
rp_module_flags="!x86 !mali"

function depends_gearboy() {
    getDepends build-essential libfreeimage-dev libopenal-dev libpango1.0-dev libsndfile1-dev libudev-dev libasound2-dev libjpeg-dev libtiff5-dev libwebp-dev automake libconfig++-dev
    #if [[ "$__raspbian_ver" -lt "8" ]]; then
    #    getDepends libjpeg8-dev
    #else
    #    getDepends libjpeg-dev
    #fi
}

function sources_gearboy() {
    gitPullOrClone "$md_build" https://github.com/DrHelius/GearBoy.git
}

function build_gearboy() {
    if [[ "$__raspbian_ver" -lt "8" ]]; then
        cd "$md_build/platforms/raspberrypi"
    else
        cd "$md_build/platforms/raspberrypi2"
    fi

    make clean
    make
    strip "gearboy"
    if [[ "$__raspbian_ver" -lt "8" ]]; then
        md_ret_require="$md_build/platforms/raspberrypi/gearboy"
    else
        md_ret_require="$md_build/platforms/raspberrypi2/gearboy"
    fi
}

function install_gearboy() {
    if [[ "$__raspbian_ver" -lt "8" ]]; then
        cp "$md_build/platforms/raspberrypi/Gearboy/gearboy" "$md_inst/gearboy"
    else
        cp "$md_build/platforms/raspberrypi2/Gearboy/gearboy" "$md_inst/gearboy"
    fi
}

function configure_gearboy() {
    mkRomDir "gameboy"
    moveConfigFile "$home/gearboy.cfg" "$md_conf_root/gearboy/gearboy.cfg"
    addSystem 0 "$md_id" "gearboy" "$md_inst/gearboy %ROM%"
}
