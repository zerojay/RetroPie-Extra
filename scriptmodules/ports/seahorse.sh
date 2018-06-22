#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="seahorse"
rp_module_desc="Seahorse Adventures: a side scrolling platform game with a bubble shooting seahorse (Bubble Bobble meets Blaster Master)"
rp_module_licence="GPL2 https://raw.githubusercontent.com/Nebuleon/barbie-seahorse-adventures/master/LICENSE.txt"
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://www.github.com/Nebuleon/barbie-seahorse-adventures/']

function install_bin_seahorse() {
    aptInstall seahorse-adventures
}

function configure_seahorse() {
    mkRomDir "ports"
    moveConfigDir "$home/.seahorse" "$md_conf_root/$md_id"

    addPort "$md_id" "seahorse" "Seahorse Adventures" "seahorse-adventures"
}
