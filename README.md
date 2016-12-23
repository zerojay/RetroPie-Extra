# RetroPie-Extra

This is a collection of unofficial installation scripts for RetroPie allowing you to quickly and easily install emulators, ports and libretrocores that haven't been 
included in RetroPie for one reason or another. These scripts can be considered experimental at best. 

Those in the master branch have been tested reasonably and should work well but may have some flaws as they haven't gone through the RetroPie's watchful eyes yet. 
Scripts that are unfinished, untested, unpolished will not be located in this repository and instead have been moved to https://github.com/zerojay/RetroPie-Extra-unstable.

Pull requests and issue reports are accepted and encouraged as well as requests. Feel free to use the issue tracker to send me any personal requests for new scripts
that you may have.

### Installation 

Install the extra scripts

The following clones the repo to your Pi and then the install-scripts.sh installs the scripts in the master branch directly to the proper directories in RetroPie-Setup.

```
git clone https://github.com/zerojay/RetroPie-Extra.git
cd RetroPie-Extra/
./install-extras.sh
```
Run the RetroPie Setup Script (the extra scripts will be in the experimental section)
```
cd
cd RetroPie-Setup
sudo ./retropie_setup.sh
```

This script assumes that you are running it on a Raspberry Pi with the RetroPie-Setup being stored in /home/pi/RetroPie-Setup. If your setup differs, just copy the scripts directly to the folder they need to be in.

### Troubleshooting

Here are some helpful hints for getting around some possible issues that you may encounter.

##### The port I installed appears to close immediately upon launching.

In most cases, this is likely because the port requires external data files, especially in the case of game engines. In cases where shareware datafiles are available, the port will install them where possible. Otherwise, you will need to provide your own. The warning dialog box at the end of installation should usually tell you what files will be needed and where to place them. If you somehow don't see a dialog box after installation, you can open the script itself and look towards the bottom for the warning.

Another possible case is the port uses the X11 windowing system. In some cases, I've included the X11 window system because of issues such as the game not going fullscreen, or just not functioning at all without it. In these cases, you will need to tell the system that it is okay for users other than root to use X11. You can do this by running the following command:

```
dpkg-reconfigure x11-common
```

In the dialog box that comes up, you can select which users are allowed to use the X11 system. I would suggest you allow the pi user or anyone to run X11. This only needs to be done one time to fix the issue for all ports and programs that use the X11 window system. I would even suggest doing it now even if you have no intention yet of installing a port that uses X11 yet so that you do not need to deal with this issue in the future.


### Included Software
#### Master Branch
##### Emulators
- [X] - gearboy.sh - Gameboy emulator - Tested and works well.  

##### Ports
- [X] - bermudasyndrome.sh - Bermuda Syndrome engine - Tested, runs, possibly instable.  
- [X] - bloboats.sh - Fun physics game - Tested and works well, OpenGL game running through glshim.
- [X] - breaker.sh - Arkanoid clone - Tested and works well.  
- [X] - burgerspace.sh - BurgerTime clone - Tested and works well.  
- [X] - chocolate-doom.sh - DOOM source port - Tested and works well.  
- [X] - chromium.sh - Open Source Web Browser - Tested and works well.  
- [X] - corsixth.sh - Theme Hospital engine clone - Tested and works well.  
- [X] - crack-attack.sh - Tetris Attack clone - Tested and works well. Minor color issue needs to be fixed with glshim.
- [X] - crispy-doom.sh - DOOM source port - Tested and works well.  
- [X] - deadbeef.sh - Music and ripped game music player - Tested and works well.
- [X] - easyrpgplayer.sh - RPG Maker 2000/2003 interpreter - Tested and works well.  
- [X] - freeciv.sh - Civilization online clone - Tested and works well, I may soon replace it to compile latest freeciv so that players can play with newer clients.  
- [X] - freedink.sh - Dink Smallwood engine - Tested and works well.  
- [X] - freesynd.sh - Syndicate clone - Tested and has occasional crash issues. Save between levels to avoid losing progress.  
- [X] - gamemaker.sh - Install the 3 gamemaker games - Tested and works well.  
- [X] - ganbare.sh - Japanese 2D Platformer - Tested and works well, does not require Japanese to play.  
- [X] - heboris.sh - Tetris The Grand Master clone - Tested and works well, does not include audio, user needs to provide their own soundpack.  
- [X] - hurrican.sh - Turrican clone. - Tested and works well, minor graphics issues.  
- [X] - iceweasel.sh - Rebranded Firefox Web Browser - Tested and works well.  
- [X] - kaiten-patissier-cs.sh - Japanese 2D Platformer - Tested and works well, has English mode.  
- [X] - kaiten-patissier-ura.sh - Japanese 2D Platformer - Tested and works well, has English mode.  
- [X] - kaiten-patissier.sh - Japanese 2D Platformer - Tested and works well, has English mode.  
- [X] - kodi-extra.sh - Kodi Media Player 16 with controller support as a separate system - Tested and works well.  
- [X] - kweb.sh - Minimal kiosk web browser - Tested and working well generally. Media may not be working well, I need to understand it better first to say.  
- [X] - manaplus.sh - 2D MMORPG client - Tested and works well, requires mouse.  
- [X] - maelstrom.sh - Classic Mac Asteroids Remake - Tested and works well, button configuration screen may crash.
- [X] - mayhem.sh - Remake of the Amiga game - Tested and works well.
- [X] - nxengine.sh - The standalone version of the open-source clone/rewrite of Cave Story - Tested and works well.
- [X] - pingus.sh - Lemmings clone - Tested and works well, requires mouse.  
- [X] - rawgl.sh - Another World source port - Tested, occasionally crashes when button held when switching scenes?  
- [X] - reminiscence.sh - Flashback engine clone - Tested and works well.   
- [X] - retrobattle.sh - Fun retro style platform game - Tested and works well.
- [X] - roadfighter.sh - RoadFighter clone - Tested and works well.  
- [X] - rott.sh - Rise of the Triad source port - Tested and works well.  
- [X] - sdl-bomber.sh - Simple Bomberman clone - Tested and works well, turn down the volume perhaps.  
- [X] - smw-netplay.sh - Super Mario War with netplay - Tested and works well, netplay untested?  
- [X] - sorr.sh - Streets of Rage Remake port - Tested and works well. Use fullscreen fast video mode.
- [X] - supertuxkart.sh - Linux-themed racing game - Tested and works well, OpenGL game running through glshim.
- [X] - tinyfugue.sh - MUD client - Tested and works well.  
- [X] - ulmos-adventure.sh - Simple Adventure Game - Tested and works well.  
- [X] - vorton.sh - Highway Encounter Remake in Spanish - Tested and works well.
- [X] - warmux.sh - Worms Clone - Tested and works well. Possible issues with config files in wrong places?
- [X] - weechat.sh - Console IRC Client - Tested and works well.
- [X] - wizznic.sh - Puzznic clone - Tested and works well.  

##### Supplementary
- [X] - attract-mode.sh - Emulator Frontend - Tested and works well, not intended to completely replace EmulationStation.
- [X] - screenshot.sh - Take screenshots remotely through SSH - Tested and works well.  
- [X] - splashscreen-extra.sh - Install additional user-created splashscreens for RetroPie - Tested and works well.  

#### Future To-Do List (not ordered by priority)
- [X] - glshim  
- [ ] - SDLash/Xash Half-Life engine through glshim.  
- [ ] - Beatfever Mania.  
- [ ] - Stepmania/Frets on Fire through glshim/new OpenGL driver.  
- [ ] - John's Shadow Warrior Port (jswp)  

### Hall of Fame - Scripts accepted into RetroPie-Setup
- [X] - LXDE - LXDE Desktop
- [X] - SimCoupe - Sam Coupe Emulator
- [X] - Oricutron - Oric 1/Oric Atmos emulator
- [X] - sdltrs - Radio Shack TRS-80 Model I/III/4/4P emulator
- [X] - ti99sim - Texas Instruments 99A emulator

### Contact Info/Additional Information
Twitter: @zerojay - often posting new information and additions from the repository to the #retropie hashtag.  
IRC: zerojay on irc.freenode.net, #retropie/#retropie-extra.

If you wish to be up-to-date about all the changes happening to the repository as they happen, feel free to join the #retropie-extra channel on Freenode.
