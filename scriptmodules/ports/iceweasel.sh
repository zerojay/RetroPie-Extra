#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="iceweasel"
rp_module_desc="IceWeasel - Rebranded Firefox Web Browser"
rp_module_menus="4+"
rp_module_flags="nobin !mali !x86"

function depends_iceweasel() {
    getDepends xorg matchbox
}

function install_iceweasel() {
    aptInstall iceweasel
}

function configure_iceweasel() {
    mkdir -p "$md_inst"
    cat >"$md_inst/iceweasel.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/bin/iceweasel
_EOF_
    chmod +x "$md_inst/iceweasel.sh"
    
     addPort "$md_id" "iceweasel" "IceWeasel - Rebranded Firefox Web Browser" "xinit $md_inst/iceweasel.sh"
}
