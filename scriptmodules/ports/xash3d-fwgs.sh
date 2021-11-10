#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="xash3d-fwgs"
rp_module_desc="xash3d-fwgs - Half-Life Engine Port"
rp_module_help="Please add your full version Half-Life data files (everything from the /valve folder) to $romdir/ports/xash3d-fwgs/valve/ to play. If using usbmount, please edit /etc/usbmount/usbmount.conf and remove noexec."
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_xash3d-fwgs() {
    getDepends libsdl2-dev libfontconfig1-dev libfreetype6-dev
}

function sources_xash3d-fwgs() {
    # Until our pull request is accepted.
    gitPullOrClone "$md_build/$md_id" https://github.com/FWGS/xash3d-fwgs.git
    gitPullOrClone "$md_build/hlsdk" https://github.com/FWGS/hlsdk-xash3d.git
    gitPullOrClone "$md_build/bshiftsdk" https://github.com/FWGS/hlsdk-xash3d.git "bshift"
    gitPullOrClone "$md_build/opforsdk" https://github.com/FWGS/hlsdk-xash3d.git "opfor"
}

function build_xash3d-fwgs() {
    cd "$md_build/$md_id"
    ./waf configure -T release
    ./waf build
    cd "$md_build/hlsdk"
    ./waf configure -T release
    ./waf build
    mkdir "$md_build/hlsdk/build/output"
    mkdir "$md_build/hlsdk/build/output/hlsdk"
    cp "$md_build/hlsdk/build/cl_dll/client_armv8_32hf.so" "$md_build/hlsdk/build/output/hlsdk/"
    cp "$md_build/hlsdk/build/dlls/hl_armv8_32hf.so" "$md_build/hlsdk/build/output/hlsdk/"
    cd "$md_build/bshiftsdk"
    ./waf configure -T release
    ./waf build
    mkdir "$md_build/bshiftsdk/build/output"
    mkdir "$md_build/bshiftsdk/build/output/bshiftsdk"
    cp "$md_build/bshiftsdk/build/cl_dll/client_armv8_32hf.so" "$md_build/bshiftsdk/build/output/bshiftsdk/"
    cp "$md_build/bshiftsdk/build/dlls/bshift_armv8_32hf.so" "$md_build/bshiftsdk/build/output/bshiftsdk/"
    cd "$md_build/opforsdk"
    ./waf configure -T release
    ./waf build
    mkdir "$md_build/opforsdk/build/output"
    mkdir "$md_build/opforsdk/build/output/opforsdk"
    cp "$md_build/opforsdk/build/cl_dll/client_armv8_32hf.so" "$md_build/opforsdk/build/output/opforsdk/"
    cp "$md_build/opforsdk/build/dlls/opfor_armv8_32hf.so" "$md_build/opforsdk/build/output/opforsdk/"
    md_ret_require=(
        "$md_build/$md_id/build/game_launch/xash3d"
        "$md_build/$md_id/build/engine/libxash.so"
        "$md_build/$md_id/build/mainui/libmenu.so"
        "$md_build/$md_id/build/ref_soft/libref_soft.so"
        "$md_build/$md_id/build/ref_gl/libref_gl.so"
    )
}

function install_xash3d-fwgs() {
    md_ret_files=(
        "$md_id/build/game_launch/xash3d"
        "$md_id/build/engine/libxash.so"
        "$md_id/build/mainui/libmenu.so"
        "$md_id/build/ref_soft/libref_soft.so"
        "$md_id/build/ref_gl/libref_gl.so"
        "hlsdk/build/output/hlsdk"
        "bshiftsdk/build/output/bshiftsdk"
        "opforsdk/build/output/opforsdk"
    )

}

function configure_xash3d-fwgs() {
    mkRomDir "ports/$md_id/valve"
    ln -s "$romdir/ports/$md_id/valve" "$md_inst/valve"
    ln -s "$romdir/ports/$md_id/bshift" "$md_inst/bshift"
    ln -s "$romdir/ports/$md_id/gearbox" "$md_inst/gearbox"
    mkdir "$romdir/ports/$md_id/valve/cl_dlls"
    mkdir "$romdir/ports/$md_id/valve/dlls"
    mkdir "$romdir/ports/$md_id/bshift/cl_dlls"
    mkdir "$romdir/ports/$md_id/bshift/dlls"
    mkdir "$romdir/ports/$md_id/gearbox/cl_dlls"
    mkdir "$romdir/ports/$md_id/gearbox/dlls"
    cp "$md_build/hlsdk/build/output/hlsdk/client_armv8_32hf.so" "$romdir/ports/$md_id/valve/cl_dlls/"
    cp "$md_build/hlsdk/build/output/hlsdk/hl_armv8_32hf.so" "$romdir/ports/$md_id/valve/dlls/"
    cp "$md_build/bshiftsdk/build/output/bshiftsdk/client_armv8_32hf.so" "$romdir/ports/$md_id/bshift/cl_dlls/"
    cp "$md_build/bshiftsdk/build/output/bshiftsdk/bshift_armv8_32hf.so" "$romdir/ports/$md_id/bshift/dlls/"
    cp "$md_build/opforsdk/build/output/opforsdk/client_armv8_32hf.so" "$romdir/ports/$md_id/gearbox/cl_dlls/"
    cp "$md_build/opforsdk/build/output/opforsdk/opfor_armv8_32hf.so" "$romdir/ports/$md_id/gearbox/dlls/"
    chown -R $user:$user "$romdir/ports/$md_id/valve/"
    chown -R $user:$user "$romdir/ports/$md_id/bshift/"
    chown -R $user:$user "$romdir/ports/$md_id/gearbox/"

    addPort "$md_id" "xash3d-fwgs" "xash3d-fwgs - Half-Life Engine" "pushd $romdir/ports/$md_id/; LD_LIBRARY_PATH=$md_inst $md_inst/xash3d -width 1280 -height 720 -fullscreen -console; popd" 
}
