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
        appearance
        battery
        bluetooth
        dashboard
        datetime
        dir
        disk
        diskimages
        diskutility
        display
        dns
        dock
        finder
        filevault
        firewall
        gatekeeper
        hostname
        hotcorners
        info
        itunes
        keyboard
        launchpad
        locale
        lock
        ntp
        printer
        missioncontrol
        network
        nosleep
        notification
        power
        restart
        safeboot
        screensaver
        scrolling
        service
        shutdown
        sleep
        spotlight
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

```

####  Airdrop:
```
    usage: m airdrop [ onlywifi | help ]

    Examples:
      m airdrop onlywifi YES      #  allow airdropping only via WIFI
      m airdrop onlywifi NO       #  allow airdropping via any network interface
```

####  Airport:
```
    usage: m airport [
                       disconnectonlogout   |
                       preferrednetworks    |
                       nonpreferrednetworks |
                       rememberrecents      |
                       secureadhocnetworks  |
                       securechangenetworks |
                       securetogglepower    |
                       help
                     ]

    Examples:
      m airport disconnectonlogout   [ YES | NO ]     #  whether to disconnect from wifi when logging out
      m airport rememberrecents      [ YES | NO ]     #  whether to remember recent networks

      m airport preferrednetworks    [                #  what to do when preferred networks are available
                                       Automatic |
                                       Preferred |
                                       Ranked    |
                                       Recent    |
                                       Strongest
                                     ]

      m airport nonpreferrednetworks [                #  how to join non-preferred networks if preferred
                                       Prompt      |  #  networks are unavailable
                                       JoinOpen    |
                                       KeepLooking |
                                       DoNothing
                                     ]

      m airport secureadhocnetworks  [ YES | NO ]     #  whether a password is required to create a
                                                      #  computer-to-computer network
      m airport securechangenetworks [ YES | NO ]     #  whether a password is required to change
                                                      #  networks
      m airport securetogglepower    [ YES | NO ]     #  whether a password is required to turn
                                                      #  wi-fi on or off
```

#### Appearance:
```
    usage: m appearance [ inputfocusring | darkmode | transparency | antialiasthreshold | sidebariconsize | maincolor | highlightcolor | help ]

    Examples:
      m appearance inputfocusring     [ YES | NO ]                # Whether to show the focus ring when an input gains focus
      m appearance darkmode           [ YES | NO ]                # Whether to use dark versions of interface elements
      m appearance transparency       [ YES | NO ]                # Whether to allow the OS to make certain elements semi-transparent
      m appearance antialiasthreshold x                           # The threshold above which antialiasing is turned on
      m appearance sidebariconsize    [ small | medium | large ]  # The size of the icons in various window sidebars
      m appearance maincolor          [ blue | graphite ]         # The color used for the majority of the interface elements
      m appearance highlightcolor     [                           # The color used for the majority of the interface elements
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
```

####  Battery:
```
    usage: m battery [ status | help ]

    Examples:
      m battery status    # get the battery status
```

#### Bluetooth:
```
    usage: m bluetooth [ status | enable | disable | help ]

    Examples:
      m bluetooth status    # bluetooth status
      m bluetooth enable    # turn on bluetooth
      m bluetooth disable   # turn off bluetooth
```

#### Dashboard:
```
    usage: m dashboard [ enable | disable | help ]

    Examples:
      m dashboard enable    # Enable the dashboard
      m dashboard disable   # Disable the dashboard
```

#### Date and Time:
```
    usage: m datetime [ 24hourclock | usentpserver | ntpserver | international | menubarformat | help ]

    Examples:
      m datetime 24hourclock    [ YES | NO ] # Whether to show the time using a 24 hour clock
      m datetime usentpserver   [ YES | NO ] # Whether the current date time can be set via NTP
      m datetime ntpserver      hostname     # The NTP server to use to set the time
      m datetime international  [ YES ]      # Sets the date/time formats to the international standard
      m datetime menubarformat  format       # Sets format of the clock in the menu bar
```

#### Debug Mode:
```
    usage: m debugmode [ enable | disable ]  # whether extra debugging options should
                                             # be exposed for various applications
```


####  Disk:
```
    usage: m disk [ ls | list | info | fs | filesystems | ejectall | verify | repair | help ]

    Examples:
      m disk ls                                 # list disks
      m disk list                               # list disks
      m disk list /dev/disk0                    # list a specific disk

      m disk fs                                 # list available filesystems for formatting
      m disk filesystems                        # list available filesystems for formatting

      m disk info /dev/disk0                    # display information

      m disk ejectall                           # eject all mountable volumes

      m disk verify volume /Volume/MyVol        # verify volume
      m disk verify disk /dev/disk0             # verify disk

      m disk repair volume /Volume/MyVol        # repair volume
      m disk repair disk /dev/disk0             # repair disk

      m disk format MS-DOS MYNAME /dev/disk2              # format the entire disk with a windows format (MS-DOS)
      m disk format volume MS-DOS MYNAME /Volumes/myvol   # format the volume with a windows format (MS-DOS)

      m disk reformat /Volumes/myvol            # reformat a volume
      m disk rename CURRENTNAME NEWNAME         # rename a volume

```

#### Disk Images:
```
    usage: m diskimages [ automount | verification | help ]

    Examples:
      m diskimages automount    [ YES | NO ] # Whether to automount disk images
      m diskimages verification [ YES | NO ] # Whether to verify disk image integrity
```

#### Display:
```
    usage: m display [ status | lightsensor | help ]

    Example:
      m display status                       # status of displays
      m display autobrightness [ YES | NO ]  # whether to enable the ambient light sensor
                                             # to automatically darken/brighten the screen
```

#### Dns:
```
    usage:  m dns [ flush | help ]

    Examples:
      m dns flush       # flushes local DNS

```

#### Dock:
```
    usage: m dock [
                    enable              |
                    disable             |
                    activeindicators    |
                    bounceonappactivity |
                    bounceonapplaunch   |
                    autohidedelay       |
                    autohidespeed       |
                    autohide            |
                    fullscreendelay     |
                    itunesnotifications |
                    magnification       |
                    magnificationsize   |
                    hiddenappdimming    |
                    iconsize            |
                    onlyshowrunning     |
                    position            |
                    addblankspace       |
                    addrecentitems      |
                    prune               |
                    help
                  ]

    Examples:
      m dock enable                 # Shows the Dock
      m dock disable                # Causes the Dock to be hidden and never reappear
      m dock activeindicators YES   # Show the active indicators under the app icons
      m dock bounceonappactivity    # Bounce an app's icon when it has activity
      m dock bounceonapplaunch      # Bounce an app's icon when it is launching
      m dock autohidedelay x.x      # Changes how long the Dock takes to show up when auto-hide is enabled
      m dock autohidespeed x.x      # Changes how long the Dock takes to slide into/out of view after the
                                    # delay has expired
      m dock autohide YES           # Enable Dock's auto hide feature
      m dock autohide NO            # Disable Dock's auto hide feature
      m dock fullscreendelay YES    # Whether to have a delay when showing the dock in full screen mode
      m dock itunesnotifications NO # Whether to show iTunes notifications in the dock
      m dock magnification YES      # Turn magnification on
      m dock magnification NO       # Turn magnification off
      m dock magnificationsize x    # Set the max size of the icons as the cursor gets closer to them
      m dock hiddenappdimming YES   # Show apps that have been hidden as semi-transparent
      m dock iconsize x             # Set the size of the icons when the dock is at rest
      m dock onlyshowrunning YES    # Only show the apps that are currently running.  Apps cannot be pinned.
      m dock position BOTTOM        # Change Dock's position to the bottom of the screen
      m dock position LEFT          # Change Dock's position to the left of the screen
      m dock position RIGHT         # Change Dock's position to the right of the screen
      m dock addblankspace          # Add a blank space (separator) to the Dock
      m dock addrecentitems         # Add a stack containg your recent items to the Dock
                                    # (You can change the stack's type by right clicking on it)
      m dock prune                  # Remove all items from dock
```

#### Dir:
```
    usage: m dir [ tree | size | delete | help ]

    Examples:
      m dir tree        # tree view of folders in the current path
      m dir tree /path  # tree view of folders in a specific path

      m dir delete empty          # delete empty folders recursively in the current path
      m dir delete empty /path    # delete empty folders recursively in a specific path

      m dir delete dsfiles        # delete .DS_Store files recursively in the current path
      m dir delete dsfiles /path  # delete .DS_Store files recursively in a specific path

      m dir size        # calculate current folder size
      m dir size /path  # calculate folder size in a specific path

```

#### Disk Utility:
```
    usage: m diskutility [ advancedoptions | showhiddenpartitions | showunsupportednetworks | help ]

    Examples:
      m diskutility advancedoptions         [ YES | NO ]  # Whether to enable advanced disk utility options
      m diskutility showhiddenpartitions    [ YES | NO ]  # Whether to show hidden partitions
      m diskutility showunsupportednetworks [ YES | NO ]  # Whether to show unsupported networks
```

#### File Vault:
```
    usage: m filevault [ status | enable | disable | help ]

    Examples:
      m filevault status    # FileVault Status
      m filevault enable    # Enable FileVault
      m filevault disable   # Disable FileVault
```

#### Finder:
```
    usage: m finder [ showhiddenfiles | showfileextensions | showdesktop | help  ]

    Examples:
      m finder showhiddenfiles           # get the current status
      m finder showhiddenfiles YES       # show hidden files
      m finder showhiddenfiles NO        # no show hidden files

      m finder showextensions            # get the current status
      m finder showextensions YES        # show all file extensions
      m finder showextensions NO         # don't show all file extensions

      m finder showdesktop               # get the current desktop status
      m finder showdesktop YES           # enable the desktop
      m finder showdesktop NO            # disable the desktop

```

#### Firewall:
```
    usage: m firewall [ status | enable | disable | list | add | remove | help ]

    Examples:
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

#### Gatekeeper:
```
    usage: m gatekeeper [ status | list | ls | enable | disable | create | help ]

    Examples:
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
    usage: m group [ list | ls | info | adduser | removeuser | ismember | help ]

    Examples:
      m group list                          # get list of groups
      m group info mygroup                  # display group information

      m group adduser myuser mygroup        # add an user to a specific group
      m group removeuser myuser mygroup     # remove an user from a specific group

      m group ismember myuser mygroup       # show if the user is a member of a specific group

```

#### Hostname:
```
    usage: m hostname [ help ]

    Examples:
      m hostname                # get the current hostname information (computername, hostname, localhostname and netbiosname)
      m hostname newhostname    # set a new hostname (computername, hostname, localhostname, netbiosname)

      m hostname help           # only shows this help
```

#### Hot Corners:
```
    usage: m hotcorners set [ bottomleft | bottomright | topright | topleft ]
                            [
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
    usage: m info [ help ]

    Examples:
      m info        #  print macOS operating system version information
```

### iTunes:
```
    usage: m itunes [ status | play | pause | next | prev | mute | unmute | vol up | vol down | vol # | stop | quit | autobackup | mediakeys | help ]

    Examples:
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
    usage: m keyboard [
                    accentedpress       |
                    spellchecking       |
                    textsubstitution    |
                    usefunctionkeys     |
                    inputfieldaccess    |
                    autodim             |
                    autodimdelay        |
                    keyrepeatrate       |
                    keyrepeatdelay      |
                    help
                  ]

    Examples:
      m keyboard accentedpress    [ YES | NO ]   # Whether to enable press and hold to show accented characters
      m keyboard spellchecking    [ YES | NO ]   # Whether to enable spell check indication (red squiggly lines)
      m keyboard textsubstitution [ YES | NO ]   # Whether to substitute quotes, dashes, spelling corrections, etc automatically
      m keyboard usefunctionkeys  [ YES | NO ]   # Whether to use F1 function keys or alternate function keys (brightness, etc)
      m keyboard inputfieldaccess [              # Specify which input fields can be tabbed through
                                    BASIC                |
                                    ALL_EXCEPT_DROPDOWNS |
                                    ALL
                                  ]
      m keyboard autodim          [ YES | NO ]   # Whether to automatically dim the keyboard brightness when idle
      m keyboard autodimdelay     2              # How long to wait before dimming the keyboard brightness
      m keyboard keyrepeatrate    4              # How quickly a held key repeats
      m keyboard keyrepeatdelay   1.2            # How long a key needs to be held before repeating
```

#### Launchpad:
```
    usage: m launchpad [ prune | help ]

    Examples:
      m launchpad prune   # Remove all items from launchpad
```

#### Locale:
```
    usage: m locale [ onlywifi | help ]

    Examples:
      m locale language <language_code>      # Specify the language to use (eg en_US)
      m locale unit     [ metric | english ] # Specify the measurement unit
```

#### Lock:
```
    usage:  m lock [ help ]

    Examples:
      m lock      # lock session
```

#### Ntp:
```
    usage: m ntp [ status | enable | disable | set | help ]

    Examples:
      m ntp status                          # status of the network time service
      m ntp enable                          # enable clock to use network time
      m ntp disable                         # disable clock to use network time
      m ntp set timehost1.net.sap.corp      # set network time server
```

#### Printer:
```
    usage: m printer [ settings | name | queue | drivers | web | help ]

    Examples:
      m printer settings    # Printer settings
      m printer name        # Display printer names on system
      m printer queue       # Display items in printer queue on system
      m printer drivers     # Display all printer drivers
      m printer web         # Enable and show web interface
```

#### Mission Control:
```
    usage: m missioncontrol [ showcenter | help ]

    Examples:
      m missioncontrol dashboardvisible   [ YES | NO ]  #
      m missioncontrol groupwindowsbyapp  [ YES | NO ]  #
      m missioncontrol animationspeed     x.x           #
```

#### Network:
```
    usage:  m network [ ls | list | location | help ]

    Examples:
      m network ls                          # list network interfaces
      m network location                    # get current location
      m network location ls                 # list locations
      m network location create XYZ         # create a location
      m network location delete XYZ         # delete a location
      m network location switch XYZ         # switch location
```

#### Nosleep:
```
    usage: m nosleep [ until | help ]

    Examples:
      m nosleep until 3600            # no sleep until 3600 seconds
      m nosleep until my_script.sh    # no sleep until the script ends

      m nosleep until pid 64377       # no sleep until the process id ends
```

#### Notification:
```
    usage: m notification [ showcenter | help ]

    Examples:
      m notification showcenter      # get the current status
      m notification showcenter YES  # enable the notification center
      m notification showcenter NO   # disable the notification center
      m notification bannertime x    # disable the notification center

```

#### Power:
```
    usage: m power [
                     disksleeptime     |
                     displaysleeptime  |
                     hibernationdelay  |
                     sleepdelay        |
                     powernap          |
                     powerbuttonsleeps |
                     appnapp           |
                     help
                   ]

    Every command that has two entries requires both the battery setting and the
    plugged setting (in that order).

    Examples:
      m power disksleeptime     x x                         # Time until disks sleep
      m power displaysleeptime  x x                         # Time until displays sleep
      m power hibernationdelay  x x                         # Time until system hibernates
      m power sleepdelay        x x                         # Time until system sleeps
      m power powernap          [ YES | NO ] [ YES | NO ]   # Whether power nap is enabled
      m power powerbuttonsleeps [ YES | NO ]                # Whether pressing the power button sleeps the system
      m power appnap            [ YES | NO ]                # Whether app nap is enabled
```

#### Restart:
```
    usage:  m restart [ -f | --force | help ]

    Examples:
      m restart     # restart computer (needs confirmation)
      m restart -f  # restart computer (without confirmation)
```

#### Safeboot:
```
    usage: m safeboot [ status | enable | disable | help ]

    Examples:
      m safeboot status     # get the boot args
      m safeboot enable     # enable safe boot
      m safeboot disable    # disable safeboot
```

#### Screensaver:
```
    usage: m screensaver [ status | askforpassword | passworddelay | help ]

    Examples:
      m screensaver                         # launch screensaver

      m screensaver status                  #  get the current status
      m screensaver askforpassword          #  get password requirement to unlock
      m screensaver askforpassword YES      #  enable password requirement to unlock
      m screensaver askforpassword NO       #  disable password requirement to unlock
      m screensaver passworddelay x         #  the length of time before screensaver requires password
```

#### Scrolling:
```
    usage: m scrolling [ direction | barvisibility | bounce | autoscrolldelay | momentum | help ]

    Examples:
      m scrolling direction       [ natural | inverted ]          # What direction the content moves when swiping
      m scrolling barvisibility   [ onlywhenscrolling | always ]  # When to show scroll bars
      m scrolling bounce          [ YES | NO ]                    # Whether to bounce at the end of scrolling
      m scrolling autoscrolldelay x                               # Set the delay before the windows contents begins to scroll when you drag content to the edge
      m scrolling momentum        [ YES | NO ]                    # Whether to use momentum when scrolling
```

#### Service:
```
    usage: m service [ --status-all | --list |  --ls | start | stop | load | unload | help ]


    Examples:
      m service --status-all                        # list all services

      m service --list                              # list all services
      m service --ls                                # list all services
      m service --ls com.apple.sessionlogoutd       # show information about a specific service

      m service start com.apple.sessionlogoutd      # start a service
      m service stop com.apple.sessionlogoutd       # stop a service

      m service load com.apple.sessionlogoutd       # load a service
      m service unload com.apple.sessionlogoutd     # unload a service

```

#### Shutdown:
```
    usage:  m  shutdown [-f | --force | help ]

    Examples:
      m shutdown     # shutdown computer (needs confirmation)
      m shutdown -f  # shutdown computer (without confirmation)
```

#### Sleep:
```
    usage: m sleep [ help ]

    Examples:
      m sleep       #  put the mac to sleep
```

#### Spotlight:
```
    usage: m spotlight [ shortcutkeys | help ]

    Examples:
      m spotlight shortcutkeys [ YES | NO ] # Whether to enable the Cmd-Space shortcuts
```

#### Time Machine:
```
    usage: m timemachine [ enable | disable | help ]

    Examples:
      m timemachine usenewdisks          [ YES | NO ]  # Whether to use new disks for backups
      m timemachine useallnetworkvolumes [ YES | NO ]  # Whether to use unsupported network volumes for backups
      m timemachine localbackups         [ YES | NO ]  # Whether to enable local backups
      m timemachine addexclusion         path          # Specify a path to be excluded from backups
```

#### Timezone:
```
    usage: m timezone [ list | ls | set | help ]

    Examples:
      m timezone                    # get current timezone
      m timezone ls                 # list available timezones
      m timezone set Europe/Berlin  # set timezone
```

#### Tooltips:
```
    usage: m tooltips [ delay | autowrap | fontsize | fontname | help ]

    Examples:
      m tooltips delay    x             # Set the delay before the tooltip shows up
      m tooltips autowrap [ YES | NO ]  # Whether tooltips should wrap
      m tooltips fontsize x.x           # The size of the font in the tooltip
      m tooltips fontname <font name>   # The name of the font in the tooltip
```

#### Trash:
```
    usage: m trash [ status | clean | help ]

    Examples:
      m trash status    # get trash info
      m trash clean     # clean trash
```

#### Update
```
    usage: m update [ list | install | help ]

    Examples:
      m update list                                                 # list available updates
      m update install all                                          # install all the available updates
      m update install iTunesX-12.4.1 RAWCameraUpdate6.20-6.20      # install specific updates
```

#### User
```
    usage: m user [ list | ls | info | create | delete | help ]

    Examples:
      m user ls                # list users
      m user info demouser     # display user information

      m user create            # create a user, it will ask you the below information
                                    Username:
                                    Full name:
                                    Shell [/bin/bash]:
                                    Password:

      m user delete demouser   # delete user
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
    usage:  m vpn [ ls | list | start | stop | status | help ]

    Examples:
      m vpn ls                              # list VPN connections

      m vpn start                           # interactive mode
      m vpn start VPN                       # start vpn connection named VPN
      m vpn start VPN USER                  # start a vpn connection with a given user
      m vpn start VPN USER PASS             # start a vpn connection with a given user and password
      m vpn start VPN USER PASS SECRET      # start a vpn connection with a given user, password, and secret

      m vpn stop VPN                        # stop vpn connection named VPN
      m vpn status VPN                      # status vpn connection named VPN

```

#### Wallpaper:
```
    usage: m wallpaper [ /path/to/file.jpg | help ]

    Examples:
      m wallpaper ./wallpapers/tree.jpg  # set wallpaper
```

#### Wifi:
```
    usage:  m wifi [ scan | off | on | connect | help ]

    Examples:
      m wifi status                  # wifi status
      m wifi scan                    # scan wifi
      m wifi showpassword [ESSID]    # show wifi network password (default: current)
      m wifi history                 # wifi connection history
      m wifi off                     # turn off your wifi
      m wifi on                      # turn on your wifi
      m wifi connect ESSID PASSWORD  # join a wifi network
      m wifi connect ESSID           # join a wifi network (prompt for password)

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
