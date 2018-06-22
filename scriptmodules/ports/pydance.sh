#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="pydance"
rp_module_desc="pydance - Open Source Dancing Game"
rp_module_licence="MIT https://raw.githubusercontent.com/asb/pydance/master/LICENSE"
rp_module_help="Be sure to add your songs to $md_conf_root/$md_id/songs. For more information about adding songs from other games to pydance, please take a look at the pydance homepage: https://icculus.org/pyddr/"
rp_module_section="exp"
rp_module_flags="!mali"
rp_module_sites=['https://www.github.com/asb/pydance']

function depends_pydance() {
    getDepends python-pygame
}

function sources_pydance() {
    wget https://icculus.org/pyddr/pydance-1.1.0.tar.gz
    tar zxvf ./pydance-1.1.0.tar.gz
}

function install_pydance() {
    cp -Rv "$md_build/pydance-1.1.0/" "$md_inst"
}

function configure_pydance() {
    moveConfigDir "$home/.pydance" "$md_conf_root/$md_id"
    mkdir "$md_conf_root/$md_id/cdtitles"
    mkdir "$md_conf_root/$md_id/songs"
    mkdir "$md_conf_root/$md_id/themes"
    mkdir "$md_conf_root/$md_id/themes/dj"
    cd "$md_conf_root/$md_id/themes/dj"
    if [ ! -f "$md_conf_root/$md_id/themes/dj/mrt/its_good.ogg" ]; then
        wget https://icculus.org/pyddr/mrt.tar.gz
        tar zxvf ./mrt.tar.gz
        rm ./mrt.tar.gz
    fi
    cd "$md_conf_root/$md_id/songs"
    if [ ! -f "$md_conf_root/$md_id/songs/forkbomb.ogg" ]; then
        wget https://icculus.org/pyddr/forkbomb.ogg
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/forkbomb.dance" ]; then
        wget https://icculus.org/pyddr/forkbomb.dance
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/forkbomb-bg.jpg" ]; then
        wget https://icculus.org/pyddr/forkbomb-bg.jpg
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/forkbomb-banner.png" ]; then
        wget https://icculus.org/pyddr/forkbomb-banner.png
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/6jan.ogg" ]; then
        wget https://icculus.org/pyddr/6jan.ogg
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/6jan.dance" ]; then
        wget https://icculus.org/pyddr/6jan.dance
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/6jan-bg.jpg" ]; then
        wget https://icculus.org/pyddr/6jan-bg.jpg
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/6jan-banner.png" ]; then
        wget https://icculus.org/pyddr/6jan-banner.png
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/synrg.ogg" ]; then
        wget https://icculus.org/pyddr/synrg.ogg
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/synrg.dance" ]; then
        wget https://icculus.org/pyddr/synrg.dance
    fi
    if [ ! -f "$md_conf_root/$md_id/songs/synrg-bg.png" ]; then
        wget https://icculus.org/pyddr/synrg-bg.png
    fi
    cd "$md_conf_root/$md_id/cdtitles"
    if [ ! -f "$md_conf_root/$md_id/cdtitles/pydance.png" ]; then
        wget https://icculus.org/pyddr/pydance-cdtitle.png
        mv pydance-cdtitle.png pydance.png
    fi
    chown -R $user:$user /opt/retropie/ports/pydance
    addPort "$md_id" "pydance" "pydance - Open Source Dancing Game" "pushd $md_inst/pydance-1.1.0/; python pydance.py; popd"
}
