#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="pico8"
rp_module_desc="pico8 - The Fantasy Game Console"
rp_module_help="Place your purchased pico8 zip file in $home/pico8.zip and add games to $romdir/pico8."
rp_module_section="exp"
rp_module_flags="!mali !x11"

function depends_pico8() {
    getDepends wiringpi unzip
}

function sources_pico8() {
    if [ -f "$home/pico8.zip" ]
    then
	unzip "$home/pico8.zip" -d "$md_build"
    else
        error="You must purchase pico8 and place the received zip file at $home/pico8.zip before installing."
    fi
}

function install_pico8() {
    md_ret_files=(
       'pico-8/license.txt'
       'pico-8/pico8.dat'
       'pico-8/pico-8.txt'
       'pico-8/pico8'
       'pico-8/pico8_dyn'
    )
}

function configure_pico8() {
    mkRomDir "$md_id"
    cp "$md_build/pico-8/lexaloffle-pico8.png" "$home/RetroPie/roms/$md_id"
    moveConfigDir "$home/.lexaloffle/" "$md_conf_root/$md_id"
    chmod +x "$md_inst/pico8_dyn"

    # Create startup script
    rm -f "$romdir/pico8/+Start PICO8.sh"
    cat > "$romdir/pico8/+Start PICO8.sh" << _EOF_
#!/bin/bash
$md_inst/pico8_dyn -root_path $homeRetroPie/roms/pico8 -splore
_EOF_
    chown $user:$user "$romdir/pico8/+Start PICO8.sh"
    chmod u+x "$romdir/pico8/+Start PICO8.sh"

    addEmulator 0 "$md_id" "pico8" "$md_inst/pico8_dyn -root_path $home/RetroPie/roms/$md_id -run %ROM%"
    addSystem "pico8" "pico8 - The Fantasy Game Console" ".sh .p8 .png .rom .SH .P8 .PNG .ROM"
}
