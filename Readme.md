#  m-cli

:boom: **Swiss Army Knife for macOS !**

[Overview](#overview)</br>
[Install](#install)</br>
[Uninstall](#uninstall)</br>
[How To Use](#how-to-use)</br>
[All Commands](#all-commands)</br>
[Contributing](#contributing)</br>

# Overview

**m-cli** is a macOS command line tool that lets you interact with utilities and applications entirely in **Terminal**. It differs from other macOS command line tools in the following ways:

* You can easily manage administrative tasks
* It doesn't install 3rd party tools since it doesn't have dependencies
* Installation is easy and doesn't require intervention
* It only uses macOS commands


# Install

You can install **m-cli** using [Homebrew](https://brew.sh/), or you can manually install it.

### Homebrew install
If you have Homebrew installed, run:

  `brew install m-cli`

### Manual install
If you want to manually install **m-cli**, run:

  `curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sudo sh`

  You can also install it to a different path, shown below:

  `INSTALL_DIR=$HOME/.m-cli sh <(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh)`

  _Note: Certain plugins, such as that for the "gatekeeper" command, will not work if `m-cli` is installed with standard user privilege. Certain plugins, such as that for the "trash" command, will not work until and unless your terminal emulator is granted Full Disk Access (look under "Security & Privacy" in System Preferences)._
  
 # Uninstall
 
 To uninstall **m-cli** from your system, run:
 
 `m --uninstall`

# How To Use

**m-cli** commands are executed using the following steps:

#### 1. Run `m`to display all of the commands (utilities) available in **m-cli**.
#### 2. Run `m <command>` to display the options available for this command.
#### 3. Run `m <command> <option>` to execute an option for this command.

A diagram of this structure is shown below:

```
m
|___itunes
|     |___status
|     |___play
|     |___pause
|     |
|     ...
|
|___disk 
      |___ls
      |___list
      |___fs
      ...
```

For example, running `m itunes` will display the options available for iTunes, as shown below:

```
    usage: m itunes [ status | play | pause | next | prev | mute | unmute | vol up | vol down | vol #| stop | quit | help ]

    Examples:
      m itunes status       # Show status
      m itunes play         # Play track
      m itunes pause        # Pause track
      m itunes next         # Play next track
      m itunes prev         # Play previous track
      m itunes mute         # Mute iTunes
      m itunes unmute       # Unmute iTunes
      m itunes vol up       # Volume Up
      m itunes vol down     # Volume Down
      m itunes vol #        # Set volume level
      m itunes stop         # Stop track
      m itunes quit         # Quit iTunes
```

In this example, running `m itunes play` will play the current selected track in your iTunes music library. 

# All Commands

**m-cli** currently supports the following commands:

`help`</br>
`airdrop`</br>
`appearance`</br>
`audio`</br>
`battery`</br>
`bluetooth`</br>
`dir`</br>
`disk`</br>
`display`</br>
`dns`</br>
`dock`</br>
`fan`</br>
`finder`</br>
`firewall`</br>
`flightmode`</br>
`gatekeeper`</br>
`group`</br>
`hostname`</br>
`info`</br>
`itunes`</br>
`localhost`</br>
`lock`</br>
`network`</br>
`nosleep`</br>
`notification`</br>
`ntp`</br>
`printer`</br>
`restart`</br>
`safeboot`</br>
`screensaver`</br>
`service`</br>
`shutdown`</br>
`sleep`</br>
`timezone`</br>
`touchbar`</br>
`trash`</br>
`update`</br>
`user`</br>
`volume`</br>
`vpn`</br>
`wallpaper`</br>
`wifi`</br>

# Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :metal:

# TODO:
* Add more plugins
* Improve the help
* Improve the installation script

## Resources:
- [Awesome OSX Command Line](https://github.com/herrbischoff/awesome-osx-command-line)
- [Apple MacOS Command Line Documentation](https://ss64.com/osx/)

## Thanks
[guarinogabriel/Mac-CLI](https://github.com/guarinogabriel/Mac-CLI) was a great source of inspiration.


---
[MIT License](LICENSE.md) © Rogelio Cedillo
