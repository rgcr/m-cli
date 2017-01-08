#  m-cli

:boom: **Swiss Army Knife for macOS !**

## The difference

**m-cli** differs from other mac command line tools in that:

* Its main purpose is to manage administrative tasks and do it easier
* It doesn't install 3rd party tools because it doesn't have dependencies
* The installation is very easy and doesn't require intervention
* It only uses macOS commands


## Installation

* **Using Homebrew:**

  `brew install m-cli`

* **Manual installation:**

  `curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh`

  You can also install it in a different path

  `INSTALL_DIR=$HOME/.m-cli sh <(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh)`

  _Note: You need privileges_



## Usage

```

  Swiss Army Knife for macOS ! 


usage:  m [OPTIONS] COMMAND [help]

    OPTIONS
        --update        update m-cli to the latest version
        --uninstall     uninstall m-cli

    COMMANDS:
        help
        airdrop
        airport
        animations
        appearance
        battery
        bluetooth
        dashboard
        datetime
        debugmode
        dialog
        dir
        disk
        diskimages
        diskutility
        display
        dns
        dock
        filevault
        finder
        firewall
        fullscreen
        gatekeeper
        group
        hostname
        hotcorners
        info
        itunes
        keyboard
        launchpad
        locale
        location
        lock
        missioncontrol
        network
        nosleep
        notification
        ntp
        power
        printer
        restart
        safeboot
        screencapture
        screensaver
        scrolling
        service
        shutdown
        sleep
        sound
        spotlight
        system
        timemachine
        timezone
        tooltip
        trash
        update
        user
        volume
        vpn
        wallpaper
        wifi
        windows

```

####  Airdrop:
```
    Usage:
      m airdrop onlywifi [ YES | NO ]       # Whether to allow all interfaces (or only wifi) to be airdropped to

    Examples:
      m airdrop onlywifi YES
```

####  Airport:
```
    Usage:
      m airport disconnectonlogout   [ YES | NO ]     #  whether to disconnect from wifi when logging out
      m airport nonpreferrednetworks [                #  how to join non-preferred networks if preferred
                                       Prompt      |  #  networks are unavailable
                                       JoinOpen    |
                                       KeepLooking |
                                       DoNothing
                                     ]
      m airport preferrednetworks    [                #  what to do when preferred networks are available
                                       Automatic |
                                       Preferred |
                                       Ranked    |
                                       Recent    |
                                       Strongest
                                     ]
      m airport rememberrecents      [ YES | NO ]     #  whether to remember recent networks
      m airport secureadhocnetworks  [ YES | NO ]     #  whether a password is required to create a
                                                      #  computer-to-computer network
      m airport securechangenetworks [ YES | NO ]     #  whether a password is required to change
                                                      #  networks
      m airport securetogglepower    [ YES | NO ]     #  whether a password is required to turn
                                                      #  wi-fi on or off
```

#### Animations:
```
    Usage:
      m animations mail       [ YES | NO ]          # Whether to use animations in mail
      m animations inputs     [ YES | NO ]          # Whether to use animations interacting with inputs
      m animations finder     [ YES | NO ]          # Whether to use animations in finder/desktop
      m animations fullscreen [ YES | NO ]          # Whether to use animations in fullscreen
      m animations windows    [ YES | NO ] [ x.x ]  # Whether to use animations when opening, closing or resizing windows (with optional speed factor)
      m animations quicklook  [ YES | NO ] [ x.x ]  # Whether to use animations when using quicklook
```

#### Appearance:
```
    Usage:
      m appearance darkmode           [ YES | NO ]                # Whether to use dark versions of interface elements
      m appearance transparency       [ YES | NO ]                # Whether to allow the OS to make certain elements semi-transparent
      m appearance antialiasthreshold x                           # The threshold above which antialiasing is turned on
      m appearance sidebariconsize    [ small | medium | large ]  # The size of the icons in various window sidebars
      m appearance maincolor          [ blue | graphite ]         # The color used for the majority of the interface elements
      m appearance highlightcolor     [                           # The color used for highlights
                                        graphite  | cayenne    | asparagus  | clover    |
                                        teal      | midnight   | plum       | tin       |
                                        nickel    | mocha      | fern       | moss      |
                                        ocean     | eggplant   | maroon     | steel     |
                                        aluminum  | maraschino | lemon      | spring    |
                                        turquoise | blueberry  | magenta    | iron      |
                                        magnesium | tangerine  | lime       | seafoam   |
                                        aqua      | grape      | strawberry | tungsten  |
                                        silver    | salmon     | banana     | flora     |
                                        ice       | orchid     | bubblegum  | lead      |
                                        mercery   | cantaloupe | honeydew   | spindrift |
                                        sky       | lavender   | carnation  | licorice  |
                                        snow
                                      ]

    Examples:
      m appearance antialiasthreshold 8                           # Only a font size of 8pt or above will be anti-aliased
```

####  Battery:
```
    usage: m battery [ status | help ]

    Examples:
      m battery status    # get the battery status
```

#### Bluetooth:
```
    Usage:
      m bluetooth status    # bluetooth status
      m bluetooth enable    # turn on bluetooth
      m bluetooth disable   # turn off bluetooth
```

#### Dashboard:
```
    Usage:
      m dashboard enable    # Enable the dashboard
      m dashboard disable   # Disable the dashboard
```

#### Date and Time:
```
    Usage:
      m datetime 24hourclock    [ YES | NO ] # Whether to show the time using a 24 hour clock
      m datetime usentpserver   [ YES | NO ] # Whether the current date time can be set via NTP
      m datetime ntpserver      hostname     # The NTP server to use to set the time
      m datetime international  [ YES ]      # Sets the date/time formats to the international standard
      m datetime menubarformat  format       # Sets format of the clock in the menu bar
```

#### Debug Mode:
```
    Usage:
      m debugmode enable    # whether extra debugging options should be exposed for various applications
      m debugmode disable
```

#### Dialog:
```
    Usage:
      m dialogs autoexpand  [ YES | NO ]  # Whether print, save and other dialogs auto-expand
```

#### Dir:
```
    Usage:
      m dir tree                  # tree view of folders in the current path
      m dir tree /path            # tree view of folders in a specific path

      m dir delete empty          # delete empty folders recursively in the current path
      m dir delete empty /path    # delete empty folders recursively in a specific path

      m dir delete dsfiles        # delete .DS_Store files recursively in the current path
      m dir delete dsfiles /path  # delete .DS_Store files recursively in a specific path

      m dir size                  # calculate current folder size
      m dir size /path            # calculate folder size in a specific path

      m dir show /path            # remove hidden flag from a directory
      m dir hide /path            # add hidden flag to a directory
```

#### Disk:
```
    Usage:
      m disk ls                                         # list disks
      m disk list                                       # list disks
      m disk list /dev/disk0                            # list a specific disk

      m disk fs                                         # list available filesystems for formatting
      m disk filesystems                                # list available filesystems for formatting

      m disk info /dev/disk0                            # display information

      m disk ejectall                                   # eject all mountable volumes

      m disk verify volume /Volume/MyVol                # verify volume
      m disk verify disk /dev/disk0                     # verify disk

      m disk repair volume /Volume/MyVol                # repair volume
      m disk repair disk /dev/disk0                     # repair disk

      m disk format MS-DOS MYNAME /dev/disk2            # format the entire disk with a windows format (MS-DOS)
      m disk format volume MS-DOS MYNAME /Volumes/myvol # format the volume with a windows format (MS-DOS)

      m disk reformat /Volumes/myvol                    # reformat a volume
      m disk rename CURRENTNAME NEWNAME                 # rename a volume

      m disk remotesharing [ YES | NO ]                 # whether disks are allowed to be shared remotely
      m disk autoplay      [ YES | NO ]                 # whether the system should open a window when a drive is inserted
```

#### Disk Images:
```
    Usage:
      m diskimages automount    [ YES | NO ] # Whether to automount disk images
      m diskimages verification [ YES | NO ] # Whether to verify disk image integrity
```

#### Disk Utility:
```
    Usage:
      m diskutility advancedoptions         [ YES | NO ]  # Whether to enable advanced disk utility options
      m diskutility showhiddenpartitions    [ YES | NO ]  # Whether to show hidden partitions
      m diskutility showunsupportednetworks [ YES | NO ]  # Whether to show unsupported networks
```

#### Display:
```
    Usage:
      m display status                       # status of displays
      m display autobrightness [ YES | NO ]  # whether to enable the ambient light sensor to automatically darken/brighten the screen
```

#### Dns:
```
    Usage:
      m dns flush       # flushes local DNS

```

#### Dock:
```
    Usage:
      m dock enable                             # Shows the Dock
      m dock disable                            # Causes the Dock to be hidden and never reappear
      m dock activeindicators     [ YES | NO ]  # Whether to show the active indicators under the app icons
      m dock autohide             [ YES | NO ]  # Whether to enable Dock's auto hide feature
      m dock autohidedelay        x.x           # Changes how long the Dock takes to show up when auto-hide is enabled
      m dock autohidespeed        x.x           # Changes how long the Dock takes to slide into/out of view after the delay has expired
      m dock bounceonappactivity  [ YES | NO ]  # Whether to bounce an app's icon when it has activity
      m dock bounceonapplaunch    [ YES | NO ]  # Whether to bounce an app's icon when it is launching
      m dock fullscreendelay      [ YES | NO ]  # Whether to have a delay when showing the dock in full screen mode
      m dock hiddenappdimming     [ YES | NO ]  # Whether to show apps that have been hidden as semi-transparent
      m dock iconsize             x             # Set the size of the icons when the dock is at rest
      m dock itunesnotifications  [ YES | NO ]  # Whether to show iTunes notifications in the dock
      m dock magnification        [ YES | NO ]  # Whether to turn magnification on
      m dock magnificationsize    x             # Set the max size of the icons as the cursor gets closer to them
      m dock onlyshowrunning      [ YES | NO ]  # Only show the apps that are currently running.  Apps cannot be pinned.
      m dock position             [             # Change Dock's position to the bottom of the screen
                                    BOTTOM |
                                    LEFT   |
                                    RIGHT
                                  ]
      m dock prune                              # Remove all items from dock

      m dock addblankspace                      # Add a blank space (separator) to the Dock
      m dock addrecentitems                     # Add a stack containg your recent items to the Dock
                                                # (You can change the stack's type by right clicking on it)
```

#### File Vault:
```
    Usage:
      m filevault status                    # FileVault Status
      m filevault enable                    # Enable FileVault
      m filevault disable                   # Disable FileVault
      m filevault standbykey [ YES | NO ]   # Whether to keep the filevault key in memory during sleep
```

#### Finder:
```
    Usage:
      m finder showhiddenfiles                   [ YES | NO ]           # whether to show hidden files
      m finder showextensions                    [ YES | NO ]           # whether to show all file extensions
      m finder showdesktop                       [ YES | NO ]           # whether to enable the desktop
      m finder statusbar                         [ YES | NO ]           # whether to show the status bar
      m finder posixtitlepath                    [ YES | NO ]           # whether to show the full POSIX title in the window title
      m finder remotedsstore                     [ YES | NO ]           # whether to allow dsstore files to be created on remote volumes
      m finder extensionchangewarning            [ YES | NO ]           # whether to show the warning when changing a file's extension
      m finder quittable                         [ YES | NO ]           # whether to finder is quittable
      m finder clickthroughdestroysselection     [ YES | NO ]           # whether, when clicking through to a finder window, the current selection is destroyed
      m finder stoppreviewswhenselectionchanges  [ YES | NO ]           # whether to stop previews when selection changes
      m finder stoppreviewswhenscrolling         [ YES | NO ]           # whether to stop previews when scrolling
      m finder infopanesexpanded                 [ YES | NO ]           # whether the panes in the info panel are expanded
      m finder showrecenttags                    [ YES | NO ]           # whether to show recent tags in the sidebar
      m finder hidequicklookondeactivate         [ YES | NO ]           # whether quicklook is hidden if you switch to another app
      m finder springing                         [ YES | NO ] [ x.x ]   # whether springing is enabled and how long it takes for an item to spring
      m finder minimumplayablepreviewsize        x                      # the minimum size on which a preview will have a play button
      m finder datetype                          [                      # whether to use relative or absolute dates when showing file dates
                                                   absolute   |
                                                   relative
                                                 ]
      m finder defaultlocation                   [                      # the location that new finder windows will open to by default
                                                   computer   |
                                                   volume     |
                                                   desktop    |
                                                   documents  |
                                                   allmyfiles |
                                                   home       |
                                                   /path
                                                 ]
```

#### Firewall:
```
    Usage:
      m firewall status                            # Show status
      m firewall enable                            # Enable firewall
      m firewall disable                           # Disable firewall
      m firewall list                              # List applications handled by firewall
      m firewall autoallowsignedapps  [ YES | NO ] # Whether to allow signed applications automatically
      m firewall blockall             [ YES | NO ] # Whether to block all incoming connections
      m firewall logging              [ YES | NO ] # Whether to enable firewall logging
      m firewall stealth              [ YES | NO ] # Whether to respond to pings
      m firewall add /path/to/file                 # Add app to firewall
      m firewall remove /path/to/file              # Remove app from firewall
```

#### Full Screen:
```
    Usage:
      m fullscreen sortbymostrecentlyused [ YES | NO ]   # Whether to the full screen apps reorder based on activity
      m fullscreen switchonactivation     [ YES | NO ]   # Whether to switch to full screen app when activating the application (say by clicking in the dock)
      m fullscreen separatedisplays       [ YES | NO ]   # Whether each display has its own set of full screen apps
```

#### Gatekeeper:
```
    Usage:
      m gatekeeper status                               # gatekeeper status
      m gatekeeper list                                 # list rules

      m gatekeeper enable                               # enable gatekeeper
      m gatekeeper disable                              # disable gatekeeper

      m gatekeeper enable MYRULE                        # enable rule
      m gatekeeper disable MYRULE                       # disable rule

      m gatekeeper create  RULENAME /path/to/program    #  Create a rule for the application

```

#### Group:
```
    Usage:
      m group list                          # get list of groups
      m group info mygroup                  # display group information

      m group adduser myuser mygroup        # add an user to a specific group
      m group removeuser myuser mygroup     # remove an user from a specific group

      m group ismember myuser mygroup       # show if the user is a member of a specific group

```

#### Hostname:
```
    Usage:
      m hostname                # get the current hostname information (computername, hostname, localhostname and netbiosname)
      m hostname <newhostname>  # set a new hostname (computername, hostname, localhostname, netbiosname)
```

#### Hot Corners:
```
    Usage:
      m hotcorners set [ bottomleft | bottomright | topright | topleft ] [
                                                                           donothing              |
                                                                           missioncontrol         |
                                                                           showapplicationwindows |
                                                                           desktop                |
                                                                           startscreensaver       |
                                                                           disablescreensaver     |
                                                                           dashboard              |
                                                                           sleepdisplay           |
                                                                           launchpad              |
                                                                           notificationcenter
                                                                         ]
```

#### Info:
```
    Usage:
      m info        #  print macOS operating system version information
```

### iTunes:
```
    Usage:
      m itunes status                   # Show status
      m itunes play                     # Play track
      m itunes pause                    # Pause track
      m itunes next                     # Play next track
      m itunes prev                     # Play previous track
      m itunes mute                     # Mute iTunes
      m itunes unmute                   # Unmute iTunes
      m itunes vol up                   # Volume Up
      m itunes vol down                 # Volume Down
      m itunes vol #                    # Set volume level
      m itunes stop                     # Stop track
      m itunes quit                     # Quit iTunes
      m itunes autobackup [ YES | NO ]  # Whether to backup devices after sync
      m itunes mediakeys  [ YES | NO ]  # Whether to enable iTunes media keys
```

#### Keyboard:
```
    Usage:
      m keyboard accentedpress    [ YES | NO ]   # Whether to enable press and hold to show accented characters
      m keyboard spellchecking    [ YES | NO ]   # Whether to enable spell check indication (red squiggly lines)
      m keyboard textsubstitution [ YES | NO ]   # Whether to substitute quotes, dashes, spelling corrections, etc automatically
      m keyboard usefunctionkeys  [ YES | NO ]   # Whether to use F1 function keys or alternate function keys (brightness, etc)
      m keyboard inputfieldaccess [              # Specify which input fields can be tabbed through
                                    basic              |
                                    allexceptdropdowns |
                                    all
                                  ]
      m keyboard autodim          [ YES | NO ]   # Whether to automatically dim the keyboard brightness when idle
      m keyboard autodimdelay     x              # How long to wait before dimming the keyboard brightness
      m keyboard keyrepeatrate    x              # How quickly a held key repeats
      m keyboard keyrepeatdelay   x.x            # How long a key needs to be held before repeating
```

#### Launchpad:
```
    Usage:
      m launchpad prune   # Remove all items from launchpad
```

#### Locale:
```
    Usage:
      m locale language <language_code>      # Specify the language to use (eg en_US)
      m locale unit     [ metric | english ] # Specify the measurement unit
```

#### Location:
```
    Usage:
      m location enable    # Enable the location service
      m location diable    # Disable the location service
```

#### Lock:
```
    Usage:
      m lock      # lock session
```

#### Menubar:
```
    Usage:
      m menubar autohide [ YES | NO ]   # Whether to autohide the menu bar
      m menubar airplay  [ YES | NO ]   # Whether to show the airplay options in the menu bar
```

#### Mission Control:
```
    Usage:
      m missioncontrol dashboardvisible   [ YES | NO ]  #
      m missioncontrol groupwindowsbyapp  [ YES | NO ]  #
      m missioncontrol animationspeed     x.x           #
```

#### Network:
```
    Usage:
      m network ls                            # list network interfaces
      m network location                      # get current location
      m network location ls                   # list locations
      m network location create XYZ           # create a location
      m network location delete XYZ           # delete a location
      m network location switch XYZ           # switch location
      m network defaultusername "your name"   # the default username when connecting (don't specify a name to disable)
      m network wakeonethernet  [ YES | NO ]  # whether to allow the computer to wake up if it receives a special network packet
      m network guestaccess     [ YES | NO ]  # whether to allow the guest user to access shared folders
```

#### Nosleep:
```
    Usage:
      m nosleep until <number_of_seconds>   # no sleep until number of seconds elaspes
      m nosleep until <script_path>         # no sleep until the script ends
      m nosleep until pid <pid_id>          # no sleep until the process id ends

    Examples:
      m nosleep until 3600
      m nosleep until my_script.sh
      m nosleep until pid 64377
```

#### Notification:
```
    Usage:
      m notification showcenter [ YES | NO ]  # whether to enable the notification center
      m notification bannertime x             # disable the notification center
```

#### Ntp:
```
    Usage:
      m ntp status                          # status of the network time service
      m ntp enable                          # enable clock to use network time
      m ntp disable                         # disable clock to use network time
      m ntp set <time_server_hostname>      # set network time server

    Examples:
      m ntp set timehost1.net.sap.corp
```

#### Power:
```
    Usage:
      Every command that has two entries requires both the battery setting and the
      plugged setting (in that order).

      m power disksleeptime     x x                         # Time until disks sleep
      m power displaysleeptime  x x                         # Time until displays sleep
      m power hibernationdelay  x x                         # Time until system hibernates
      m power sleepdelay        x x                         # Time until system sleeps
      m power powernap          [ YES | NO ] [ YES | NO ]   # Whether power nap is enabled
      m power powerbuttonsleeps [ YES | NO ]                # Whether pressing the power button sleeps the system
      m power appnap            [ YES | NO ]                # Whether app nap is enabled
      m power restartonhang     [ YES | NO ]                # Whether to restart on system hang
      m power persistmemory     [ YES | NO ]                # Whether RAM contains working memory when sleeping ("NO" is more secure)
```

#### Printer:
```
    Usage:
      m printer settings                        # Printer settings
      m printer name                            # Display printer names on system
      m printer queue                           # Display items in printer queue on system
      m printer drivers                         # Display all printer drivers
      m printer web                             # Enable and show web interface
      m printer quitwhenfinished [ YES | NO ]   # whether the print dialog should be closed when printing is finished
```

#### Restart:
```
    Usage:
      m restart           # restart computer (needs confirmation)
      m restart --force   # restart computer (without confirmation)
```

#### Safeboot:
```
    Usage:
      m safeboot status     # get the boot args
      m safeboot enable     # enable safe boot
      m safeboot disable    # disable safeboot
```

#### Screen Capture:
```
    Usage:
      m screencapture type        [             # Specify the type of the screenshots
                                    png  |
                                    jpg  |
                                    tiff |
                                    pdf
                                  ]
      m screencapture location    /path         # The location the screenshots will be saved to
      m screencapture filename                  # The filename the screenshots will be saved under (suffixed by date)
      m screencapture shadow      [ YES | NO ]  # Whether the screenshots will contain a drop shadow
```

#### Screensaver:
```
    Usage:
      m screensaver                               # launch screensaver
      m screensaver status                        #  get the current status
      m screensaver askforpassword [ YES | NO ]   #  whether to enable password requirement to unlock
      m screensaver passworddelay  x              #  the length of time before screensaver requires password
```

#### Scrolling:
```
    Usage:
      m scrolling direction       [ natural | inverted ]          # What direction the content moves when swiping
      m scrolling barvisibility   [ onlywhenscrolling | always ]  # When to show scroll bars
      m scrolling bounce          [ YES | NO ]                    # Whether to bounce at the end of scrolling
      m scrolling autoscrolldelay x                               # Set the delay before the windows contents begins to scroll when you drag content to the edge
      m scrolling momentum        [ YES | NO ]                    # Whether to use momentum when scrolling
```

#### Service:
```
    Usage:
      m service --status-all                        # list all services

      m service --list                              # list all services
      m service --ls                                # list all services
      m service --ls <service_name>                 # show information about a specific service

      m service start <service_name>                # start a service
      m service stop <service_name>                 # stop a service

      m service load <service_name>                 # load a service
      m service unload <service_name>               # unload a service

    Examples:
      m service --ls com.apple.sessionlogoutd
      m service start com.apple.sessionlogoutd
      m service stop com.apple.sessionlogoutd
      m service load com.apple.sessionlogoutd
      m service unload com.apple.sessionlogoutd

```

#### Shutdown:
```
    Usage:
      m shutdown     # shutdown computer (needs confirmation)
      m shutdown -f  # shutdown computer (without confirmation)
```

#### Sleep:
```
    Usage:
      m sleep       #  put the mac to sleep
```

#### Sound:
```
    Usage
      m sound startupchime        [ YES | NO ]          # whether the startup chime is used
      m sound volumefeedback      [ YES | NO ]          # whether or not you hear feedback when the volume is changed
      m sound ui                  [ YES | NO ] [ x.x ]  # whether the UI bleeps and bloops are used
      m sound speechrecognition   [ YES | NO ]          # whether speech recognition is enabled
      m sound speechtotext        [ YES | NO ]          # whether speech-to-text is enabled
      m sound voiceover           [ YES | NO ]          # whether VoiceOver is enabled
      m sound powerchime          [ YES | NO ]          # whether the chime is used when power is connected/disconnected
```

#### Spotlight:
```
    Usage:
      m spotlight shortcutkeys [ YES | NO ] # Whether to enable the Cmd-Space shortcuts
```

#### System:
```
    Usage:
      m system quarantine                 [ YES | NO ]   # Whether to enable app quarantine
      m system automaticapptermination    [ YES | NO ]   # Whether to enable automatic app termination
      m system documentversioning         [ YES | NO ]   # Whether to enable document versioning
      m system crashreporter              [ YES | NO ]   # Whether to enable the crash reporter
      m system savetoicloudbydefault      [ YES | NO ]   # Whether to save to iCloud by default
      m system savewindowsonquit          [ YES | NO ]   # Whether to save window state
```

#### Time Machine:
```
    Usage:
      m timemachine usenewdisks          [ YES | NO ]  # Whether to use new disks for backups
      m timemachine useallnetworkvolumes [ YES | NO ]  # Whether to use unsupported network volumes for backups
      m timemachine localbackups         [ YES | NO ]  # Whether to enable local backups
      m timemachine addexclusion         path          # Specify a path to be excluded from backups
```

#### Timezone:
```
    Usage:
      m timezone                        # get current timezone
      m timezone ls                     # list available timezones
      m timezone set <time_zone_name>   # set timezone

    Examples:
      m timezone set Europe/Berlin
```

#### Tooltips:
```
    Usage:
      m tooltips delay    x             # Set the delay before the tooltip shows up
      m tooltips autowrap [ YES | NO ]  # Whether tooltips should wrap
      m tooltips fontsize x             # The size of the font in the tooltip
```

#### Trash:
```
    Usage:
      m trash status                  # get trash info
      m trash clean                   # clean trash
      m trash warn      [ YES | NO ]  # warn when emptying trash
```

#### Update
```
    Usage:
      m update list                                                           # list available updates
      m update install           [ all | <package_name> ]                     # which updates to install
      m update automaticinstall  [ YES | NO ]                                 # whether automatic installs should be enabled
      m update automaticdownload [ YES | NO ]                                 # whether automatic downloads should be enabled
      m update interval          [ daily | weekly | biweekly | monthly | x ]  # how often to check for updates

    Examples:
      m update install           all                                          # install all the available updates
      m update install           iTunesX-12.4.1 RAWCameraUpdate6.20-6.20      # install specific updates
```

#### User
```
    Usage:
      m user ls                                              # list users
      m user info demouser                                   # display user information

      m user create                                          # create a user, it will ask you the below information
                                                                  Username:
                                                                  Full name:
                                                                  Shell [/bin/bash]:
                                                                  Password:

      m user delete demouser                                 # delete user
      m user autologin                [ disable | username ] # who to autologin as or whether to disable autologin
      m user fastswitching            [ YES | NO ]           # whether to enable fast user switching
      m user guest                    [ YES | NO ]           # whether to enable the guest user
      m user showsecure               [ YES | NO ]           # whether to show secure users on the login screen (such as root)
      m user loginpoweroptions        [ YES | NO ]           # whether to show power options during login
      m user loginattemptsbeforehint  x                      # the number of failed attempts before hint is shown
      m user loginmessage             "Your message"         # the custom text to show on the login screen (enter nothing to remove message)
```

#### Volume:
```
    usage:  m volume [ level(0-100) | change(-n|+n) | up | down | mute | unmute | ismute ]

    Examples:
      m volume 70     # set the volume to 70 %
      m volume +5     # increase the volume by 5 (up to 100)
      m volume -10    # decrease the volume by 5 (down to 0)
      m volume up     # increase the volume by 6.25
      m volume down   # decrease the volume by 6.25
      m volume        # get the volume level
      m volume mute   # set mute
      m volume unmute # unset mute
      m volume ismute # check the volume status
```

#### VPN:
```
    Usage:
      m vpn ls                              # list VPN connections

      m vpn start                           # interactive mode
      m vpn start VPN                       # start vpn connection named VPN
      m vpn start VPN USER                  # start a vpn connection with a given user
      m vpn start VPN USER PASS             # start a vpn connection with a given user and password
      m vpn start VPN USER PASS SECRET      # start a vpn connection with a given user,password, and secret

      m vpn stop VPN                        # stop vpn connection named VPN
      m vpn status VPN                      # status vpn connection named VPN

```

#### Wallpaper:
```
    Usage:
      m wallpaper <path_to_wallpaper_image>  # set wallpaper

    Examples:
      m wallpaper ./wallpapers/tree.jpg
```

#### Wifi:
```
    Usage:
      m wifi status                  # wifi status
      m wifi scan                    # scan wifi
      m wifi showpassword [ESSID]    # show wifi network password (default: current)
      m wifi history                 # wifi connection history
      m wifi off                     # turn off your wifi
      m wifi on                      # turn on your wifi
      m wifi connect ESSID PASSWORD  # join a wifi network
      m wifi connect ESSID           # join a wifi network (prompt for password)

```

#### Windows:
```
    Usage:
      m windows miniturizeondoubleclick [ YES | NO ]   # Whether to miniturize windows on a double click of the title bar
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :metal:

## TODO:
* Add more plugins
* Improve the help
* Improve the installation script

## Thanks
[guarinogabriel/Mac-CLI](https://github.com/guarinogabriel/Mac-CLI) was a great source of inspiration.


---
[MIT License](LICENSE.md) © Rogelio Cedillo
