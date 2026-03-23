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

## Support

Enjoying this tool? Consider [supporting development](https://www.buymeacoffee.com/rgcr) ☕

<a href="https://www.buymeacoffee.com/rgcr"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-green.png" alt="Buy Me A Coffee" height="40"></a>

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
`restart` • `remotelogin` • `safeboot` • `screensaver` • `service` • `shutdown` • `sleep` • `timezone` • `touchbar`
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
   `git checkout -b my-new-feature`
3. Commit your changes:
   `git commit -m 'Add some feature'`
4. Push the branch:
   `git push origin my-new-feature`
5. Open a Pull Request 🚀

---

## Resources

- [macOS Command Line Reference (ss64)](https://ss64.com/osx/)

---

## 🔗 More Projects

If you found this useful, you might also enjoy:

- **[iproute-mac](https://github.com/rgcr/iproute-mac)** — Native Go implementation of Linux `iproute2` for macOS (`ip`, `bridge` & `ss`).
  
- **[t-mux-manager](https://github.com/rgcr/t-mux-manager)** — Lightweight tmux session and project manager written in Bash.

- **[StickyShot](https://github.com/rgcr/stickyshot)** — Screenshot tool with floating sticky preview windows for macOS.
  
- **[Snape](https://github.com/rgcr/snape)** — A Severus Snippet Manager for macOS.

---

© Rogelio Cedillo – Licensed under the [MIT License](LICENSE.md)
