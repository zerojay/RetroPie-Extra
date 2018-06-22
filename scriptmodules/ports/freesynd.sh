#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="freesynd"
rp_module_desc="freesynd - Syndicate Engine"
rp_module_licence="GPL2 https://sourceforge.net/p/freesynd/code/HEAD/tree/freesynd/trunk/COPYING?format=raw"
rp_module_help="Please place your required Syndicate data files in /opt/retropie/ports/freesynd."
rp_module_section="exp"
rp_module_flags="!x86 !mali"
rp_module_sites=['https://sourceforge.net/projects/freesynd/']

function depends_freesynd() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev subversion libsdl-image1.2-dev libpng12-dev cmake
}

function sources_freesynd() {
    svn checkout svn://svn.code.sf.net/p/freesynd/code/ freesynd-code
}

function build_freesynd() {
    cd "$md_build/freesynd-code/freesynd/tags/release-0.7.1"
    cmake . -DCMAKE_INSTALL_PREFIX:PATH="$md_inst"
    make
    md_ret_require="$md_build/freesynd-code/freesynd/tags/release-0.7.1/src/freesynd"
}

function install_freesynd() {
    cd "$md_build/freesynd-code/freesynd/tags/release-0.7.1"
    md_ret_files=(
        'freesynd-code/freesynd/tags/release-0.7.1/src/freesynd'
        'freesynd-code/freesynd/tags/release-0.7.1/data'
    )
}

function configure_freesynd() {
    mkRomDir "ports"
    mkRomDir "ports/freesynd"
    moveConfigDir "$home/.freesynd" "$md_conf_root/freesynd"
    cp "$md_build/freesynd-code/freesynd/tags/release-0.7.1/freesynd.ini" "$md_conf_root/$md_id"
    sed -i "s/fullscreen = false/fullscreen = true/" "$md_conf_root/$md_id/freesynd.ini"
    sed -i "s/#freesynd_data_dir = \/usr\/share\/freesynd\/data/freesynd_data_dir = \/opt\/retropie\/ports\/freesynd\/data/" "$md_conf_root/$md_id/freesynd.ini"
    sed -i "s/#data_dir = \/home\/username\/dosbox\/synd\/DATA/data_dir = \/home\/pi\/RetroPie\/roms\/ports\/freesynd/" "$md_conf_root/$md_id/freesynd.ini"
    addPort "$md_id" "freesynd" "FreeSynd - Syndicate Engine" "$md_inst/freesynd" 
}
