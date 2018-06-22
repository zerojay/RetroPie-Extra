#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="burgerspace"
rp_module_desc="BurgerSpace - BurgerTime clone"
rp_module_help="Because this uses X, you may find that you are unable to control the game and the game appears in a small window in the top left. Use the Runcommand option to set the resolution to CEA-4 or similarly smaller sizes. This will allow you to control the game as the window will have focus and also fill up more of the screen. If you just get a black screen or you return to EmulationStation, please run dpkg-reconfigure xserver-xorg-legacy as root and set it so Anybody can use X. See the troubleshooting section of the RetroPie-Extras readme for more info."
rp_module_licence="GPL2 https://www.gnu.org/licenses/gpl-2.0.txt"
rp_module_section="exp"
rp_module_flags="!mali !x86"
rp_module_sites=['https://perso.b2b2c.ca/~sarrazip/dev/burgerspace.html']

function install_bin_burgerspace() {
    aptInstall burgerspace xserver-xorg-legacy
}

function configure_burgerspace() {
    mkRomDir "ports"

    moveConfigDir "$home/.burgerspace" "$md_conf_root/$md_id"
    addPort "$md_id" "burgerspace" "BurgerSpace - BurgerTime clone" "xinit /usr/games/burgerspace"
}
