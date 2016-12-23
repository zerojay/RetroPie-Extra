#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="nxengine"
rp_module_desc="Cave Story engine clone - NxEngine"
rp_module_help="Copy the original Cave Story game files to /opt/retropie/ports/nxengine so you have the file /opt/retropie/ports/nxengine/Doukutsu.exe and folder /opt/retropie/ports/nxengine/data present."
rp_module_section="opt"

function depends_nxengine() {
    getDepends libsdl1.2-dev libsdl-ttf2.0-dev
}

function sources_nxengine() {
    wget -O- -q http://nxengine.sourceforge.net/dl/nx-src-1006.tar.bz2 | tar -xvj --strip-components=1
}

function build_nxengine() {
    make clean
    make
}

function install_nxengine() {
    md_ret_files=('nx')
}

function configure_nxengine() {
    addPort "$md_id" "cavestory" "Cave Story" "$md_inst/nx"
}
