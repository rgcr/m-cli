#  m-cli

:boom: **Swiss Army Knife for Mac OS X !**

## The difference

**m-cli** differs from other mac command line tools in that:

* Its main purpose is to manage administrative tasks and do it easier
* It doesn't install 3rd party tools because it doesn't have dependencies
* The installation is very easy and doesn't require intervention
* It only uses OS X commands


## Installation

To **install** or **update** m-cli you can run this command:

`curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh`

You can also install it in a different path

`INSTALL_DIR=$HOME/.m-cli sh <(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh)`


_Note: You should reload your shell in both cases_

## Usage

```

  Swiss Army Knife for Mac OS X ! 


usage:  m [OPTIONS] COMMAND [help]

    OPTIONS
        --update        update m-cli to the latest version
        --uninstall     uninstall m-cli

    COMMANDS:
        help
        battery
        bluetooth
        dir
        disk
        dns
        dock
        finder
        firewall
        gatekeeper
        hostname
        info
        lock
        ntp
        network
        nosleep
        restart
        safeboot
        screensaver
        service
        shutdown
        sleep
        timezone
        trash
        user
        volume
        vpn
        wallpaper
        wifi

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

      m disk verify volume  /Volume/MyVol       # verify volume
      m disk verify disk /dev/disk0             # verify disk

      m disk repair volume /Volume/MyVol        # repair volume
      m disk repair disk /dev/disk0             # repair disk

      m disk format MS-DOS MYNAME  /dev/disk2             # format the entire disk with a windows format (MS-DOS)
      m disk format volume MS-DOS MYNAME /Volumes/myvol   # format the volume with a windows format(MS-DOS)

      m disk reformat /Volumes/myvol                      # reformat a volume
      m disk rename CURRENTNAME NEWNAME                   # rename a volume

```

#### Dns:
```
    usage:  m dns [ flush | help ]

    Examples:
      m dns flush       # flushes local DNS

```

#### Dock:
```
    usage: m dock [ showdelay | autohide | magnification | position | addblankspace | addrecentitems | help ]

    Examples:
      m dock showdelay x.x          # Changes how long the Dock takes to show up when auto-hide is enabled
      m dock autohide YES           # Enable Dock's auto hide feature
      m dock autohide NO            # Disable Dock's auto hide feature
      m dock magnification YES      # Turn magnification on
      m dock magnification NO       # Turn magnification off
      m dock position BOTTOM        # Change Dock's position to the bottom of the screen
      m dock position LEFT          # Change Dock's position to the left of the screen
      m dock position RIGHT         # Change Dock's position to the right of the screen
      m dock addblankspace          # Add a blank space (separator) to the Dock
      m dock addrecentitems         # Add a stack containg your recent items to the Dock
                                    #  (You can change the stack's type by right clicking on it)

```

#### Dir:
```
    usage: m dir [ tree | delete | help ]

    Examples:
      m dir tree        # tree view of folders in the current path
      m dir tree /path  # tree view of folders in a specific path

      m dir delete empty          # delete empty folders recursively in the current path
      m dir delete empty /path    # delete empty folders recursively in a specific path
```

#### Finder:
```
    usage: m finder [ showhiddenfiles | help ]

    Examples:
      m finder showhiddenfiles           # get the current status
      m finder showhiddenfiles YES       # show hidden files
      m finder showhiddenfiles NO        # no show hidden files
```

#### Firewall:
```
    usage: m firewall [ status | enable | disable | add | help ]

    Examples:
       m firewall status                # Show status
       m firewall enable                # Enable firewall
       m firewall disable               # Disable firewall
       m firewall add /path/to/file     # Add app to firewall
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

#### Hostname:
```
    usage: m hostname [ help ]

    Examples:
      m hostname                # get the current hostname information (computername, hostname, localhostname and netbiosname)
      m hostname newhostname    # set a new hostname (computername, hostname, localhostname, netbiosname)

      m hostname help           # only shows this help
```

#### Info:
```
    usage: m info [ help ]

    Examples:
      m info        #  print Mac OS X operating system version information
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
    usage: m screensaver [ askforpassword | help ]

    Examples:
      m screensaver                         # launch screensaver

      m screensaver askforpassword          #  get the current status
      m screensaver askforpassword YES      #  enable password requirement to unlock
      m screensaver askforpassword NO       #  disable password requirement to unlock
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

#### Timezone:
```
    usage: m timezone [ list | ls | set | help ]

    Examples:
      m timezone                    # get current timezone
      m timezone ls                 # list available timezones
      m timezone set Europe/Berlin  # set timezone
```

#### Trash:
```
    usage: m trash [ status | clean | help ]

    Examples:
      m trash status    # get trash info
      m trash clean     # clean trash
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
    usage:  m volume [ level(0-100) | mute | unmute | ismute ]

    Examples:
      m volume 70     # set the volume to 70 %
      m volume        # get the volume level
      m volume mute   # set mute
      m volume unmute # unset mute
      m volume ismute # check the volume status
```

#### VPN:
```
    usage:  m vpn [ ls | list | start | stop | status | help ]

    Examples:
      m vpn ls                  # list VPN connections
      m vpn start VPN           # start vpn connection named VPN
      m vpn stop VPN            # stop vpn connection named VPN
      m vpn status VPN          # status vpn connection named VPN
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
      m wifi showpassword ESSID      # show wifi network password
      m wifi history                 # wifi connection history
      m wifi off                     # turn off your wifi
      m wifi on                      # turn on your wifi
      m wifi connect ESSID PASSWORD  # join a wifi network
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :metal:

## TODO:
* Add more plugins
* Add bash and zsh completion
* Improve the help
* Improve the installation script

## Thanks
[guarinogabriel/Mac-CLI](https://github.com/guarinogabriel/Mac-CLI) was a great source of inspiration.


---
[MIT License](LICENSE.md) © Rogelio Cedillo
