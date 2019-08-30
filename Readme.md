#  m-cli

:boom: **Swiss Army Knife for macOS !**

[Overview](#overview)</br>
[Installation](#installation)</br>
[How To Use](#how-to-use)</br>
[All Commands](#all-commands)

# Overview

**m-cli** is a macOS command line tool that lets you interact with a multitude of utilities entirely in **Terminal**. You can: 

- Display battery life
- Repair and format disks
- Control iTunes
- Enable/disable flightmode
- Sleep, shutdown, and restart
- Enable/disable wifi, list known wifi networks, or join a wifi network
- Set wallpaper

...And more.

**m-cli** differs from other macOS command line tools in the following ways:

* You can easily manage administrative tasks
* It doesn't install 3rd party tools since it doesn't have dependencies
* Installation is very simple and doesn't require intervention
* Only uses macOS commands


## Installation

You can install **m-cli** using one of the following options:

#### Option 1: Homebrew install
If you have **[Homebrew](https://brew.sh/)** installed, run the following command in **Terminal**:

  `brew install m-cli`

#### Option 2: Manual install
If you want to manually install **m-cli**, run the following command in **Terminal**:

  `curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sudo sh`

  You can also install it in a different path

  `INSTALL_DIR=$HOME/.m-cli sh <(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh)`

  _Note: You need privileges_

## How To Use

The syntax for running **m-cli** commands in **Terminal** is:

### `m` + utility + command. 

A diagram of **m-cli**'s command structure is shown below:

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

For example, running `m itunes` will display the commands available for itunes, as shown below:

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

In this example, running `m itunes play` will play the current selected track in your itunes music library. 

## All Commands

**m-cli** currently supports the following utilities and applications:

`help`</br>
`battery`</br>
`bluetooth`</br>
`dir`</br>
`disk`</br>
`display`</br>
`dns`</br>
`dock`</br>
`finder`</br>
`firewall`</br>
`flightmode`</br>
`gatekeeper`</br>
`hostname`</br>
`info`</br>
`itunes`</br>
`localhost`</br>
`lock`</br>
`ntp`</br>
`printer`</br>
`network`</br>
`nosleep`</br>
`notification`</br>
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
