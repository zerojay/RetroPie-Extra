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
rp_module_help="ROM Extensions: .swf\n\nCopy your Flash games to $romdir/flash\n\nTo change resolution, open emulators.cfg and add parameters -j and -k with width and height values.\n\nSetting video mode to CEA-1 in runcommand and setting -j and -k to 640x480 yields best performance at the cost of image quality."
rp_module_licence="GPL3 https://github.com/strk/gnash/blob/master/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_gnash() {
	getDepends xinit xorg
}

function install_bin_gnash() {
	aptInstall gnash
}

function configure_gnash() {
	mkRomDir "flash"
	addEmulator 1 "$md_id" "flash" "xinit -e 'gnash --hwaccel vaapi --hide-menubar %ROM%'"
	addSystem "flash"
}
