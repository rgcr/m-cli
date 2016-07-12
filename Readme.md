#  m-cli

:boom: Swiss Army Knife for Mac OS X !

It doesn't have dependencies, it's simple, modular and extensible.

## Installation

To **install** or **update** m-cli you can run this command:

`curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh`

## Usage

```

  Swiss Army Knife for Mac OS X ! 


usage:  m [OPTIONS] COMMAND [help]

    OPTIONS
        --update        update m-cli to the last version
        --uninstall     uninstall m-cli

    COMMANDS:
        help
        battery
        bluetooth
        dir
        disk
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
        shutdown
        sleep
        timezone
        trash
        volume
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
      m showhiddenfiles           # get the current status
      m showhiddenfiles YES       # show hidden files
      m showhiddenfiles NO        # no show hidden files
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
      m hostname newhostname    # set a new hostname (computarname, hostname, localhostname, netbiosname)

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

#### Wallpaper:
```
    usage: m wallpaper [ /pat/to/file.jpg | help ]

    Examples:
      m wallpaper ./wallpapers/tree.jpg  # set wallpaper
```

#### Wifi:
```
    usage:  m wifi [ scan | off | on | connect | help ]

    Examples:
    Examples:
      m wifi status                  # wifi status
      m wifi scan                    # scan wifi
      m wifi showwpassword mywifi    # show wifi network password
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
