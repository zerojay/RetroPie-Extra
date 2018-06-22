#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rott"
rp_module_desc="rott - Rise of the Triad port"
rp_module_licence="GPL2 http://svn.icculus.org/*checkout*/rott/trunk/COPYING?revision=234"
rp_module_help="Please add your full version ROTT files to $romdir/ports/$md_id/ to play."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['http://www.icculus.org/rott/']

function depends_rott() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev automake autoconf subversion unzip
}

function sources_rott() {
    svn checkout svn://svn.icculus.org/rott/trunk/ standard
    svn checkout svn://svn.icculus.org/rott/trunk/ shareware
}

function build_rott() {
    cd standard/
    autoreconf -fiv
    ./configure --prefix="$md_inst" --enable-datadir="$romdir/ports/$md_id/standard"
    make
    
    cd ../shareware/
    autoreconf -fiv
    ./configure --prefix="$md_inst" --enable-datadir="$romdir/ports/$md_id/shareware" --enable-shareware --enable-suffix="shareware"
    make
    md_ret_require=(
        "$md_build/standard/rott/rott"
        "$md_build/shareware/rott/rott-shareware"
    )
}

function install_rott() {
    cd standard
    make install
    cd ../shareware
    make install
}

function configure_rott() {
    mkRomDir "ports"
    mkRomDir "ports/$md_id"
    mkRomDir "ports/$md_id/standard"
    mkRomDir "ports/$md_id/shareware"
    
    wget "http://icculus.org/rott/share/1rott13.zip" -O 1rott13.zip
    unzip -L -o 1rott13.zip rottsw13.shr
    unzip -L -o rottsw13.shr -d "$md_inst/shareware" huntbgin.wad huntbgin.rtc huntbgin.rtl remote1.rts
    
    moveConfigDir "$home/.rott" "$md_conf_root/rott"

    addPort "$md_id" "rott" "rott - Rise of the Triad port" "$md_inst/bin/rott"
    addPort "$md_id" "rott-shareware" "rott - Rise of the Triad port Shareware" "$md_inst/bin/rott-shareware"
}
