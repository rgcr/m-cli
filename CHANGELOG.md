# Changelog

### All notable changes to this project will be documented in this file.
----

## [2.0.4]

### updated
- **`completions/zsh/_m`**
  - Fixed completion script

## [2.0.2]

### Updated
- **`m`**
  - fixed `--version` option
- `Readme.md`
  - updated instructions and examples
  - updated `CHANGELOG.md`


----
## [2.0.0]

### Updated
- **`m` command**
  - Added `--help` and `--version` flags to the main script.
  - **Breaking Change**: New command syntax
  		- Old: `m <plugin> <subcommand> <args>` (deprecated)
    	- New: `m <plugin> <options> <args>`
    	- Example: `m bluetooth on` → `m bluetooth --enable`
    	- Note: This change may break existing scripts but provides better consistency and enables automatic completions

- **`plugins/*`**
  - Standardized `--help` output format for improved automatic completion support
  - Unified boolean value handling:
    	- Automatically converts various inputs (`on`/`off`, `1`/`0`, `true`/`false`) to `enable` `disable`. Specifically for commands that turn functionalities on or off.

- **Shell completions**
  - Rewritten to dynamically generate completions from plugin `--help` output
  - Eliminates manual maintenance of completion scripts
  - Ensures completions always stay in sync with plugin capabilities

## [0.3.1]

### Updated

- `dir` can now manage .DS_Store generations with `m dir dsfiles`
- `display` can now change brightness eg. `m display down`
- `dock` can now change the delay for autohiding eg. `m dock autohidedelay 1.0`
- `wifi`
  - `wifi ls` or `wifi list` to list wifi networks
  - `wifi forget ESSID` to forget a wifi network

### Fixed

- `bluetooth` now works on 10.12+


## [0.3.0]

### Added

- `airdrop` - Manage Airdrop
- `appearance` - Manage macOS appearance
- `localhost` - List, add and remove from hosts file
- `touchbar` - Reset the touchbar

### Updated

- `dir` can now manage .DS_Store generations with `m dir dsfiles`
- `display` can now change brightness eg. `m display down`
- `dock` can now change the delay for autohiding eg. `m dock autohidedelay 1.0`
- `wifi`
  - `wifi ls` or `wifi list` to list wifi networks
  - `wifi forget ESSID` to forget a wifi network

### Fixed

- `bluetooth` now works on 10.12+

## [0.2.5]

TODO: Back-populate the changelog...
