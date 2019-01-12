**Note** - This repository is a fork from zerojay's repository which was unmaintained. A lot of stuff is old and might not be working as intended with recent RetroPie.

# RetroPie-Extra

This is a **collection of unofficial installation scripts for RetroPie** allowing you to quickly and easily **install emulators, ports and libretrocores** that haven't been included in RetroPie (yet?) for one reason or another. These scripts can be considered experimental at best. Some of these scripts might overwrite their RetroPie's scripts counterparts.

This repository contains scripts that are being worked on and scripts that might not work out-of-the-box or not at all. Use at your own risk, I am not liable for any damage caused by any of these scripts or their affiliated software.

Pull requests and issue reports are accepted and encouraged as well as requests. Feel free to use the issue tracker to send me any personal requests for new scripts that you may have.

## Installation

The following commands clone the repo to your Raspberry Pi and then run `install-scripts.sh` to install the scripts in the `master` branch directly to the proper directories in the `RetroPie-Setup/` folder.

```bash
cd ~
git clone https://github.com/PabOu-be/RetroPie-Extra.git
cd RetroPie-Extra/
./install-extras.sh
```
The installation script assumes that you are running it on a Raspberry Pi with the `RetroPie-Setup/` folder being stored in `/home/pi/RetroPie-Setup`. If your setup differs, just copy the scripts directly to the folder they need to be in.

## Usage

After installing **RetroPie-Extra**, the extra scripts will be installed directly in the **RetroPie Setup script** (generally in the experimental section), which you can run from either the command line or from the menu within Emulation Station.
```
cd ~
cd RetroPie-Setup/
sudo ./retropie_setup.sh
```

## Updating

The following commands update your Raspberry Pi to the latest repo and then run `install-scripts.sh` to install the scripts in the `master` branch directly to the proper directories in the `RetroPie-Setup/` folder.

```bash
cd ~
cd RetroPie-Extra/
git pull origin
./install-extras.sh
```

The installation script assumes that you are running it on a Raspberry Pi with the `RetroPie-Setup/` folder being stored in `/home/pi/RetroPie-Setup`. If your setup differs, just copy the scripts directly to the folder they need to be in.


## Updating from zerojay's repository

The following commands will remove old files from the zerojay's repository which might conflict with this one.

```bash
cd ~
rm -rf RetroPie-Extra
```

You may now proceed with the installation of this repository (see the corresponding instructions above).


## Troubleshooting

Here are some helpful hints for getting around some possible issues that you may encounter.

### The port I installed appears to close immediately upon launching.

In most cases, this is likely because the port requires external data files, especially in the case of game engines. In cases where shareware datafiles are available, the port will install them where possible. Otherwise, you will need to provide your own. The warning dialog box at the end of installation should usually tell you what files will be needed and where to place them. If you somehow don't see a dialog box after installation, you can open the script itself and look towards the bottom for the warning.


## Included Software

### Master Branch

#### Emulators

- [ ] - `atari800.sh` - Atari 800/5200 emulator with additional joystick support - **5200 is tested, 800 is not.**
- [ ] - `gearboy.sh` - Gameboy emulator - **Tested and works well.**
- [ ] - `kat5200.sh` - Atari 8-bit/5200 emulator - **Only set up for 5200 at the moment.**
- [ ] - `pokemini.sh` - Pokemon Mini emulator - **Tested and works well.**

#### Libretrocores

- [ ] - `lr-mame2003_midway.sh` - MAME 0.78 core with Midway games optimizations.

#### Ports

- [ ] - `amphetamine.sh` - 2D Platforming Game - **Tested, runs well. Requires keyboard.**
- [ ] - `barrage.sh` - Shooting Gallery action game - **Tested and works well, requires mouse.**
- [ ] - `bermudasyndrome.sh` - Bermuda Syndrome engine - **Tested, runs, possibly instable.**
- [ ] - `bloboats.sh` - Fun physics game - **Tested and works well, OpenGL game running through glshim.**
- [ ] - `breaker.sh` - Arkanoid clone - **Tested and works well.**
- [X] - `burgerspace.sh` - BurgerTime clone - **[20190109] Tested on rpi and works.**
- [ ] - `chocolate-doom`.sh - DOOM source port - **Tested and works well.**
- [ ] - `chromium.sh` - Open Source Web Browser - **Tested and works well.**
- [X] - `corsixth.sh` - Theme Hospital engine clone - **[20190109] Tested on rpi and works.**
- [ ] - `crack-attack.sh` - Tetris Attack clone - **Tested and works well. Minor color issue needs to be fixed with glshim.**
- [ ] - `crispy-doom.sh` - DOOM source port - **Tested and works well.**
- [ ] - `deadbeef.sh` - Music and ripped game music player - **Tested and works well.**
- [ ] - `easyrpgplayer.sh` - RPG Maker 2000/2003 interpreter - **Tested and works well.**
- [X] - `freeciv.sh` - Civilization online clone - **[20190109] Tested on rpi and works, zerojay wanted to replace it to compile latest freeciv so that players can play with newer clients.**
- [ ] - `freedink.sh` - Dink Smallwood engine - **Tested and works well.**
- [ ] - `freesynd.sh` - Syndicate clone - **Tested and has occasional crash issues. Save between levels to avoid losing progress.**
- [X] - `gamemaker.sh` - Install the 3 gamemaker games - **[20190112] Tested on rpi and keyboard doesn't work.**
- [ ] - `ganbare.sh` - Japanese 2D Platformer - **Tested and works well, does not require Japanese to play.**
- [ ] - `hcl.sh` - Hydra Castle Labrinth - **Tested and works well.**
- [ ] - `heboris.sh` - Tetris The Grand Master clone - **Tested and works well.  To fix sound, change settings from MIDI to MP3.**
- [X] - `hurrican.sh` - Turrican clone. - **[20190110] Tested on rpi and menu is very slow with graphics issues making it unusable.**
- [ ] - `iceweasel.sh` - Rebranded Firefox Web Browser - **Tested and works well.**
- [ ] - `kaiten-patissier-cs.sh` - Japanese 2D Platformer - **Tested and works well, has English mode.**
- [ ] - `kaiten-patissier-ura.sh` - Japanese 2D Platformer - **Tested and works well, has English mode.**
- [ ] - `kaiten-patissier.sh` - Japanese 2D Platformer - **Tested and works well, has English mode.**
- [ ] - `kodi-extra.sh` - Kodi Media Player 16 with controller support as a separate system - **Tested and works well.**
- [ ] - `kweb.sh` - Minimal kiosk web browser - **Tested and working well generally. Media may not be working well, I need to understand it better first to say.**
- [ ] - `lbreakout2.sh` - Open Source Breakout game - **Tested and working well, requires mouse.**
- [ ] - `lgeneral.sh` - Open Source strategy game - **Tested and working well, requires mouse.**
- [ ] - `lmarbles.sh` - Open Source Atomix game - **Tested and working well, requires mouse.**
- [ ] - `ltris.sh` - Open Source Tetris game - **Tested and working well, requires keyboard.**
- [ ] - `manaplus.sh` - 2D MMORPG client - **Tested and works well, requires mouse.**
- [ ] - `maelstrom.sh` - Classic Mac Asteroids Remake - **Tested and works well, button configuration screen may crash.**
- [ ] - `mayhem.sh` - Remake of the Amiga game - **Tested and works well.**
- [X] - `mysticmine.sh` - from hlad : https://github.com/RetroPie/RetroPie-Setup/pull/2561 - **[20190110] Tested on rpi and works.**
- [ ] - `netsurf.sh` - Lightweight web browser - **Tested and works well.**
- [ ] - `nkaruga.sh` - Ikaruga demake. - **Tested and works well, requires keyboard.**
- [X] - `nxengine.sh` - The standalone version of the open-source clone/rewrite of Cave Story - **Tested and works well.**
- [X] - `openxcom.sh` - OpenXCOM - Open Source X-COM Engine" - **[20190110] Tested on rpi and works well.**
- [X] - `pingus.sh` - Lemmings clone - **[20190110] Tested on rpi and works well, requires mouse.**
- [ ] - `prboom-plus.sh` - Enhanced DOOM source port - lightly **tested, seems to work.**
- [ ] - `rawgl.sh` - Another World source port - **Tested, occasionally crashes when button held when switching scenes?**
- [ ] - `reminiscence.sh` - Flashback engine clone - **Tested and works well. **
- [ ] - `retrobattle.sh` - Fun retro style platform game - **Tested and works well.**
- [ ] - `rickyd.sh` - Rick Dangerous clone - **Tested and works well, requires keyboard.**
- [ ] - `rockbot.sh` - Mega Man clone. **Tested and screen flickers like crazy until proper settings are applied. Check package help for more info.**
- [ ] - `rott.sh` - Rise of the Triad source port - **Tested and works well.**
- [X] - `sdl-bomber.sh` - Simple Bomberman clone - **[20190111] Tested on rpi and works well, turn down the volume perhaps. **
- [ ] - `sorr.sh` - Streets of Rage Remake port - **Tested and works well. Use fullscreen fast video mode.**
- [X] - `solarus-1.5.3.sh` - Solarus: Fan game engine based on Zelda 3 + a few fangames. Updated version from the official RetroPie. - **[20190109] Tested on rpi and works.**
- [X] - `solarus-1.6.0.sh` - Solarus: Fan game engine based on Zelda 3 + a few fangames. Updated version from the official RetroPie. - **[20190109] Tested on rpi and does not work - I think upstream has to add support for the rpi on their new renderer (they have todo lines regarding this in the renderer code).**
- [X] - `supertuxkart.sh` - Linux-themed racing game - **[20190112] Tested on rpi and doesn't work well. Super laggy, OpenGL game running through gl4es.**
- [ ] - `texmaster2009.sh` - Tetris TGM clone - **Tested and works well.**
- [ ] - `tinyfugue.sh` - MUD client - **Tested and works well.**
- [ ] - `ulmos-adventure.sh` - Simple Adventure Game - **Tested and works well.**
- [ ] - `vgmplay.sh` - Music Player - **Tested and works well. Plays .vgm and .vgz game music rips. Command line client only.**
- [ ] - `vorton.sh` - Highway Encounter Remake in Spanish - **Tested and works well.**
- [X] - `warmux.sh` - Worms Clone - **[20190112] Tested on rpi and works well. Possible issues with config files in wrong places?**
- [ ] - `weechat.sh` - Console IRC Client - **Tested and works well.**
- [ ] - `wizznic.sh` - Puzznic clone - **Tested and works well.**
- [ ] - `zeldansq.sh` - Zelda: Navi's Quest fangame - **Tested and works well.**
- [ ] - `zeldapicross.sh` - Zelda themed Picross fangame - **Tested and works well, may require keyboard.**

#### Supplementary

- [ ] - `fun-facts-splashscreens.sh` - Set up some loading splashscreens with fun facts.
- [ ] - `joystick-selection.sh` - Set controllers for RetroArch players 1-4.
- [ ] - `screenshot.sh` - Take screenshots remotely through SSH - **Tested and works well.**

### Future To-Do List

Have a look at the [TODO.md](/TODO.md) file.

## Hall of Fame - Scripts accepted into RetroPie-Setup

- nothing yet.

## Contact Info / Additional Information

- **Email**: pabou@pabou.com
