#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="hurrican"
rp_module_desc="Hurrican - Turrican Clone"
rp_module_help="Hurrican can only be played in 640x480 so to avoid huge black borders everywhere, use runcommand to set Hurrican to run at 640x480 or 720x480 if aspect ratio matters to you. There are minor off-by-one errors in the graphics everywhere. Nothing I can do about that at the moment so please do not report it as a bug to me, but upstream instead."
rp_module_section="exp"
rp_module_flags="!mali"

function depends_hurrican() {
    local depends=(subversion libsdl-image1.2-dev libmodplug-dev bc libgles2-mesa-dev)
    if [[ "$__raspbian_ver" -lt 8 ]]; then
        depends+=(libsdl1.2-dev libsdl-mixer1.2-dev)
    else
        depends+=(libsdl2-dev libsdl2-mixer-dev)
    fi
    getDepends "${depends[@]}"
}

function sources_hurrican() {
    svn checkout svn://svn.code.sf.net/p/hurrican/code/trunk "$md_build"
    if isPlatform "rpi"; then
        sed -i 's/-I\/opt\/vc\/include\/interface\/vcos\/pthreads/-I\/opt\/vc\/include\/interface\/vcos\/pthreads -I\/opt\/vc\/include\/interface\/vmcs_host\/linux/' "$md_build/Hurrican/src/Makefile"
        sed -i 's/-L\/opt\/vc\/lib -g -lmodplug -lSDL_mixer -lSDL_image -lSDL -lGLESv2/-L\/opt\/vc\/lib -g -lmodplug -lSDL_mixer -lSDL_image -lSDL -lbrcmGLESv2 -lbcm_host -lbrcmEGL/' "$md_build/Hurrican/src/Makefile"
    fi
}

function build_hurrican() {
    cd $md_build/Hurrican/src/
    if isPlatform "rpi"; then
       make TARGET=rpi
    else
       make
    fi
    md_ret_require="$md_build"
}

function install_hurrican() {
    if isPlatform "rpi"; then
        md_ret_files=(
            'Hurrican/hurrican'
            'Hurrican/data'
            'Hurrican/lang'
            'Hurrican/splashscreen.bmp'
            'Editor/maps'
            'Editor/Gfx'
        )
    else
        md_ret_files=( 
            'Hurrican/hurricanlinux' 
            'Hurrican/data'
            'Hurrican/lang'
            'Hurrican/splashscreen.bmp'
            'Editor/maps' 
            'Editor/Gfx'     
        )
    fi
}

function configure_hurrican() {
    if isPlatform "rpi"; then
        addPort "$md_id" "hurrican" "Hurrican" "pushd $md_inst; $md_inst/hurrican; popd"
    else
        addPort "$md_id" "hurrican" "Hurrican" "pushd $md_inst; $md_inst/hurricanlinux; popd"
    fi

    mkRomDir "ports"
    moveConfigDir "$home/.hurrican" "$md_conf_root/hurrican"
    touch "$md_inst/Hurrican.cfg"
    touch "$md_inst/Hurrican.hsl"
    touch "$md_inst/Game_Log.txt"
    touch "$md_inst/Savegame0.sav"
    chown pi:pi "$md_inst/Hurrican.cfg"
    chown pi:pi "$md_inst/Hurrican.hsl"
    chown pi:pi "$md_inst/Game_Log.txt"
    chown pi:pi "$md_inst/Savegame0.sav"
}
