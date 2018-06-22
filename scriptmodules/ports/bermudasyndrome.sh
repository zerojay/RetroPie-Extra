#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="bermudasyndrome"
rp_module_desc="Bermuda Syndrome - Open Source Engine"
rp_module_help="Please copy your Bermuda Syndrome data files to $romdir/ports/$md_id before running the game."
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://lgdb.org/game/bermuda_syndrome']

function depends_bermudasyndrome() {
    getDepends libsdl1.2-dev
}

function sources_bermudasyndrome() {
    wget -O- -q http://cyxdown.free.fr/bs/bs-0.1.4.tar.bz2 | tar -xvj --strip-components=1
}

function build_bermudasyndrome() {
    make
}

function install_bermudasyndrome() {
    md_ret_files=('bs')
}

function configure_bermudasyndrome() {
    mkRomDir "ports"
    mkRomDir "ports/$md_id"
# Might be missing config dir, FIX ME.

    addPort "$md_id" "bermudasyndrome" "Bermuda Syndrome - Open Source Engine" "$md_inst/bs --datapath=$romdir/ports/$md_id --savepath=$md_conf_root/$md_id"
}
