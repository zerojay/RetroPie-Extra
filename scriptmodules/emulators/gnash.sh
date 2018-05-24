#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="gnash"
rp_module_desc="gnash - Adobe Flash SWF Player"
rp_module_help="ROM Extensions: .swf\n\nCopy your Flash games to $romdir/flash\n\nYou need to set video mode to CEA-1 in Runcommand."
rp_module_licence="GPL3 http://git.savannah.gnu.org/cgit/gnash.git/tree/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_gnash() {
	getDepends xinit
}

function install_bin_gnash() {
	aptInstall gnash
}

function configure_gnash() {
	mkRomDir "flash"
	addEmulator 1 "$md_id" "flash" "sudo xinit -e 'gnash %ROM%  -j 640 -k 480 --hide-menubar' -- :0"
	addSystem "flash"
	echo 'gnash = "CEA-1"' >> $md_conf_root/all/videomodes.cfg
}