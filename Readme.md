#  m-cli

> ⚠️ Version 2 includes breaking changes due to a new standardized syntax and improved shell autocompletion.
> See the [changelog](CHANGELOG.md) for details.


💥 **The Swiss Army Knife for macOS – in your Terminal!**

- [Installation](#installation)
- [Uninstallation](#uninstallation)
- [Usage](#usage)
- [Available Commands](#available-commands)
- [Contributing](#contributing)
- [Resources](#resources)

---

## Overview

**m-cli** is a powerful command-line tool for macOS that enables you to control system functions, manage utilities, and tweak preferences – all from the Terminal.

### Key Features:
-  Manage system and admin tasks effortlessly
-  No third-party dependencies
-  Simple, non-intrusive installation
-  Clean and safe – doesn’t modify your system unnecessarily

---

## Installation

###  Using [Homebrew](https://brew.sh/)
```sh
brew install m-cli
```
###  Or if you want to have the latest version
```sh
brew install rgcr/formulae/m-cli
```

> **Note:** When installed via Homebrew, shell autocompletion scripts are installed and configured automatically for Bash, Zsh, and Fish. No additional setup is needed.
<br/>

###  Manual Installation
```sh
curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/main/install.sh | bash
```

Ensure that `${HOME}/.local/bin` is in your `$PATH`. You can add it with:

```sh
export PATH="${HOME}/.local/bin:$PATH"
```

Add the line above to your shell config file (e.g. `~/.bashrc`, `~/.zshrc`) for persistence.

<br/>

---

### Shell Autocompletion (Manual Installation)

To enable shell autocompletion for `m`, source the appropriate file based on your shell:

#### Bash
```sh
source ~/.local/opt/m-cli/completions/bash/m
```

To make it persistent, add the above line to your `~/.bashrc` or `~/.bash_profile`.

#### Zsh
```sh
source ~/.local/opt/m-cli/completions/zsh/_m
```

To make it persistent, add the above line to your `~/.zshrc`.

#### Fish
```fish
source ~/.local/opt/m-cli/completions/fish/m.fish
```

To make it persistent, add the line to `~/.config/fish/config.fish`.

---

## Uninstallation

###  Using Homebrew
```sh
brew uninstall m-cli
```

### Manual Uninstall
```sh
m --uninstall
```

---

## Usage

- Run `m` to display all available commands.
- Run `m <command> --help` to see usage options for any specific command.

Example:
```sh
m dock --help
```

- Enjoy!

---

## Available Commands

`airdrop` • `appearance` • `audio` • `battery` • `bluetooth` • `dir` • `disk` • `display` • `dns` • `dock`
`fan` • `finder` • `firewall` • `flightmode` • `gatekeeper` • `group` • `hostname` • `hosts` • `info`
`itunes` • `lock` • `network` • `nosleep` • `notificationcenter` • `ntp` • `powermode` • `printer`
`restart` • `safeboot` • `screensaver` • `service` • `shutdown` • `sleep` • `timezone` • `touchbar`
`trash` • `update` • `usb` • `user` • `volume` • `vpn` • `wallpaper` • `wifi`

---

### Notes
- Some `macos` commands needs to be executed with `sudo` internally, so it's recommended you have `sudo` privileges.
- The `trash` command will not work unless your terminal (e.g. `iTerm2`, `Terminal.app`) has the necessary permissions to access the Trash folder. You can grant this permission in `System Preferences > Security & Privacy > Privacy > Full Disk Access`.

---


## Contributing

We ❤️ contributions!

1. Fork the repo
2. Create your feature branch:
   ```sh
   git checkout -b my-new-feature
   ```
3. Commit your changes:
   ```sh
   git commit -m 'Add some feature'
   ```
4. Push the branch:
   ```sh
   git push origin my-new-feature
   ```
5. Open a Pull Request 🚀

---

## TODO
- [ ] Add more plugins

---

## Resources

- [macOS Command Line Reference (ss64)](https://ss64.com/osx/)

---

© Rogelio Cedillo – Licensed under the [MIT License](LICENSE.md)

