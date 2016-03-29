# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-wolfenstein3d"
rp_module_desc="Chocolate Wolfenstein 3d based on Wolf4SDL"
rp_module_menus="4+"

function sources_lr-wolfenstein3d() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-wolfenstein3d.git
}

function build_lr-wolfenstein3d() {
    make clean
    make
    md_ret_require="$md_build/Chocolate-Wolfenstein-3D"
}

function install_lr-wolfenstein3d() {
    md_ret_files=(
        'Chocolate-Wolfenstein-3D'
        'audiohed.wl6'
        'audiot.wl6'
        'config.wl6'
        'gamemaps.wl6'
        'maphead.wl6'
        'vgadict.wl6'
        'vgagraph.wl6'
        'vgahead.wl6'
        'vswap.wl6'
    )
}

function configure_lr-wolfenstein3d() {
    setConfigRoot "ports"

    addPort "$md_id" "wolfenstein-3d" "Wolfenstein 3D" "pushd $md_inst; $md_inst/Chocolate-Wolfenstein-3D; popd" 
}
