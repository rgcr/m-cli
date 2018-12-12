#!fish

function __fish_m_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 0
    else
        set -l skip_next 1
        for c in $cmd[2..-1]
            test $skip_next -eq 0
            and set skip_next 1
            and continue
            switch $c
                case "--update" "--uninstall"
                    return 1
                case "*"
                    echo $c
                    return 1
            end
        end
        return 0
    end
    return 1
end



function __fish_m_using_command
    set -l cmd (__fish_m_needs_command)
    test -z "$cmd"
    and return 1
    contains $cmd $argv
    and return 0
end

complete -f -c m -n '__fish_m_needs_command' -l update -d 'Update m-cli'
complete -f -c m -n '__fish_m_needs_command' -l uninstall -d 'Uninstall m-cli'

complete -f -c m -n '__fish_m_needs_command' -a airdrop -d 'Manage airdrop status'
complete -f -c m -n '__fish_m_using_command airdrop' -a "on" -d 'turn on airdrop'
complete -f -c m -n '__fish_m_using_command airdrop' -a "enable" -d 'turn on airdrop'
complete -f -c m -n '__fish_m_using_command airdrop' -a "off" -d 'turn off airdrop'
complete -f -c m -n '__fish_m_using_command airdrop' -a "disable" -d 'turn off airdrop'
complete -f -c m -n '__fish_m_using_command airdrop' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a battery -d 'Get the battery status'
complete -f -c m -n '__fish_m_using_command battery' -a "status" -d 'Get status'
complete -f -c m -n '__fish_m_using_command battery' -a "help" -d 'Show help'

## XXX:
complete -f -c m -n '__fish_m_needs_command' -a bluetooth -d 'Manage bluetooth status'
complete -f -c m -n '__fish_m_using_command bluetooth' -a "on" -d 'turn on bluetooth'
complete -f -c m -n '__fish_m_using_command bluetooth' -a "enable" -d 'turn on bluetooth'
complete -f -c m -n '__fish_m_using_command bluetooth' -a "off" -d 'turn off bluetooth'
complete -f -c m -n '__fish_m_using_command bluetooth' -a "disable" -d 'turn off bluetooth'
complete -f -c m -n '__fish_m_using_command bluetooth' -a "help" -d 'Show help'

## XXX:
complete -f -c m -n '__fish_m_needs_command' -a dir -d 'Show and delete dir trees'
complete -f -c m -n '__fish_m_using_command dir' -a "tree" -d 'tree view of folders in the current or specified path'
complete -f -c m -n '__fish_m_using_command dir' -a "size" -d 'calculate folder size'
complete -f -c m -n '__fish_m_using_command dir' -a "delete" -d 'delete empty folders recursively in the current of specified path'
complete -f -c m -n '__fish_m_using_command dir' -a "help" -d 'Show help'

# XXX: Add completion for disk subcommands
complete -f -c m -n '__fish_m_needs_command' -a disk -d 'Manage disks and volumes'
complete -f -c m -n '__fish_m_using_command disk' -a "list" -d 'list disks'
complete -f -c m -n '__fish_m_using_command disk' -a "filesystems" -d 'list available filesystems for formatting'
complete -f -c m -n '__fish_m_using_command disk' -a "info" -d 'display information'
complete -f -c m -n '__fish_m_using_command disk' -a "ejectall" -d 'eject al mountable volumes'
complete -f -c m -n '__fish_m_using_command disk' -a "verify" -d 'verify volume or disk'
complete -f -c m -n '__fish_m_using_command disk' -a "repair" -d 'repair volume or disk'
complete -f -c m -n '__fish_m_using_command disk' -a "format" -d 'format a volume or disk'
complete -f -c m -n '__fish_m_using_command disk' -a "reformat" -d 'reformat a volume'
complete -f -c m -n '__fish_m_using_command disk' -a "rename" -d 'rename a volume'
complete -f -c m -n '__fish_m_using_command disk' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a display -d 'Display settings'
complete -f -c m -n '__fish_m_using_command display' -a "status" -d 'status of displays'
complete -f -c m -n '__fish_m_using_command display' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a dns -d 'Manage dns'
complete -f -c m -n '__fish_m_using_command dns' -a "flush" -d 'flushes local DNS'
complete -f -c m -n '__fish_m_using_command dns' -a "help" -d 'Show help'

# XXX: Add completion for dock subcommands and options
complete -f -c m -n '__fish_m_needs_command' -a dock -d 'Manage dock'
complete -f -c m -n '__fish_m_using_command dock' -a "showdelay" -d 'changes how long the Dock takes to show up when auto-hide is enabled'
complete -f -c m -n '__fish_m_using_command dock' -a "autohide" -d "enable or disable Dock's auto hide feature"
complete -f -c m -n '__fish_m_using_command dock' -a "magnification" -d "enable or disable magnification"
complete -f -c m -n '__fish_m_using_command dock' -a "position" -d "change Dock's position"
complete -f -c m -n '__fish_m_using_command dock' -a "addblankspace" -d "add a blank space(separator) to the dock"
complete -f -c m -n '__fish_m_using_command dock' -a "addrecentitems" -d "add a stack containg your recent items to the Dock"
complete -f -c m -n '__fish_m_using_command dock' -a "prune" -d "removes all apps from dock"
complete -f -c m -n '__fish_m_using_command dock' -a "help" -d 'Show help'

## XXX: Add completion for finder subcommands and options
complete -f -c m -n '__fish_m_needs_command' -a finder -d 'Manage finder properties'
complete -f -c m -n '__fish_m_using_command finder' -a "showhiddenfiles" -d 'manage hidden file visibitlity'
complete -f -c m -n '__fish_m_using_command finder' -a "showextensions" -d 'manage file extension visibitlity'
complete -f -c m -n '__fish_m_using_command finder' -a "showdesktop" -d 'manage desktop status'
complete -f -c m -n '__fish_m_using_command finder' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a firewall -d 'Manage firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "status" -d 'Show status'
complete -f -c m -n '__fish_m_using_command firewall' -a "list" -d 'List applications handled by firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "enable" -d 'Enable firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "disable" -d 'Disable firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "add" -d 'Add app to firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "remove" -d 'Remove app to firewall'
complete -f -c m -n '__fish_m_using_command firewall' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a flightmode -d 'Manage flightmode'
complete -f -c m -n '__fish_m_using_command flightmode' -a "on" -d 'Turn flightmode on'
complete -f -c m -n '__fish_m_using_command flightmode' -a "off" -d 'Turn flightmode off'
complete -f -c m -n '__fish_m_using_command flightmode' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a gatekeeper -d 'Manage gatekeeper (security for apps)'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "status" -d 'gatekeeper status'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "list" -d 'list rules'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "enable" -d 'enable gatekeeper or a rule'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "disable" -d 'disable gatekeeper or a rule'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "create" -d 'create a rule for an application'
complete -f -c m -n '__fish_m_using_command gatekeeper' -a "help" -d 'Show help'

## XXX: Add completion for group subcommands
complete -f -c m -n '__fish_m_needs_command' -a group -d 'Manage groups'
complete -f -c m -n '__fish_m_using_command group' -a "list" -d 'list of groups'
complete -f -c m -n '__fish_m_using_command group' -a "info" -d 'display group information'
complete -f -c m -n '__fish_m_using_command group' -a "adduser" -d 'add an user to a specific group'
complete -f -c m -n '__fish_m_using_command group' -a "removeuser" -d 'remove an user from a specific group'
complete -f -c m -n '__fish_m_using_command group' -a "ismember" -d 'show if the user is a member of a specific group'
complete -f -c m -n '__fish_m_using_command group' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a hostname -d "Dislays or set the computre's hostname"
complete -f -c m -n '__fish_m_using_command hostname' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a info -d 'print macOS operating system version information'
complete -f -c m -n '__fish_m_using_command info' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a itunes -d 'itunes command line control'
complete -f -c m -n '__fish_m_using_command itunes ' -a "status" -d 'show status, current artist and track'
complete -f -c m -n '__fish_m_using_command itunes ' -a "state" -d 'get player state'
complete -f -c m -n '__fish_m_using_command itunes ' -a "progress" -d 'get current progress of song (in sec)'
complete -f -c m -n '__fish_m_using_command itunes ' -a "play" -d 'start playing iTunes'
complete -f -c m -n '__fish_m_using_command itunes ' -a "pause" -d 'pause iTunes'
complete -f -c m -n '__fish_m_using_command itunes ' -a "next" -d 'go to the next track'
complete -f -c m -n '__fish_m_using_command itunes ' -a "prev" -d 'go to the previous track'
complete -f -c m -n '__fish_m_using_command itunes ' -a "mute" -d 'mute volume'
complete -f -c m -n '__fish_m_using_command itunes ' -a "unmute" -d 'mute volume'
complete -f -c m -n '__fish_m_using_command itunes ' -a "repeat" -d 'set repeat mode (options: one, all, off) [empty arg to get current repeat mode]'
complete -f -c m -n '__fish_m_using_command itunes ' -a "shuffle" -d 'toggles shuffle'
complete -f -c m -n '__fish_m_using_command itunes ' -a "vol" -d 'increase and decrease volume'
complete -f -c m -n '__fish_m_using_command itunes ' -a "stop" -d 'stop iTune'
complete -f -c m -n '__fish_m_using_command itunes ' -a "quit" -d 'quit iTunes'
complete -f -c m -n '__fish_m_using_command itunes ' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a lock -d 'Lock session'
complete -f -c m -n '__fish_m_using_command lock' -a "help" -d 'Show help'

## XXX: Add completion for network subcommands
complete -f -c m -n '__fish_m_needs_command' -a network -d 'Manage network interfaces and locations'
complete -f -c m -n '__fish_m_using_command network' -a "list" -d 'list network interfaces'
complete -f -c m -n '__fish_m_using_command network' -a "location" -d 'get or set the current location'
complete -f -c m -n '__fish_m_using_command network' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a nosleep -d 'Prevent sleeping'
complete -f -c m -n '__fish_m_using_command nosleep' -a "until" -d 'until timeout, pid or specified script ends'
complete -f -c m -n '__fish_m_using_command nosleep' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a notification -d 'Manage the Notification Settings'
complete -f -c m -n '__fish_m_using_command notification' -a "showcenter" -d 'enable or disable notification center'
complete -f -c m -n '__fish_m_using_command notification' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a ntp -d 'Manage the network time service'
complete -f -c m -n '__fish_m_using_command ntp' -a "status" -d 'status of the network time service'
complete -f -c m -n '__fish_m_using_command ntp' -a "enable" -d 'enable clock to use network time'
complete -f -c m -n '__fish_m_using_command ntp' -a "disable" -d 'disable clock to use network time'
complete -f -c m -n '__fish_m_using_command ntp' -a "set" -d 'set network time server'
complete -f -c m -n '__fish_m_using_command ntp' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a printer -d 'Display information about the printers'
complete -f -c m -n '__fish_m_using_command printer' -a "settings" -d 'Display printer settings'
complete -f -c m -n '__fish_m_using_command printer' -a "name" -d 'Display printer names on system'
complete -f -c m -n '__fish_m_using_command printer' -a "queue" -d 'Display items in printer queue on system'
complete -f -c m -n '__fish_m_using_command printer' -a "drivers" -d 'Display all printer drivers'
complete -f -c m -n '__fish_m_using_command printer' -a "web" -d 'Enable and show web interface'

## XXX: Add completion for restart options
complete -f -c m -n '__fish_m_needs_command' -a restart -d 'Restart computer'
complete -f -c m -n '__fish_m_using_command restart' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a safeboot -d 'Manage safeboot'
complete -f -c m -n '__fish_m_using_command safeboot' -a "status" -d 'get the boot args'
complete -f -c m -n '__fish_m_using_command safeboot' -a "enable" -d 'enable safeboot'
complete -f -c m -n '__fish_m_using_command safeboot' -a "disable" -d 'disable safeboot'
complete -f -c m -n '__fish_m_using_command safeboot' -a "help" -d 'Show help'

## XXX: Add completion for screensaver options
complete -f -c m -n '__fish_m_needs_command' -a screensaver -d 'Launch and manage the screensaver properties'
complete -f -c m -n '__fish_m_using_command screensaver' -a "status" -d 'get the current status'
complete -f -c m -n '__fish_m_using_command screensaver' -a "askforpassword" -d 'get,enable or disable password requirement to unlock'
complete -f -c m -n '__fish_m_using_command screensaver' -a "help" -d 'Show help'

## XXX: Add completion for service options
complete -f -c m -n '__fish_m_needs_command' -a service -d 'Manage services'
complete -f -c m -n '__fish_m_using_command service' -a "start" -d 'start a service'
complete -f -c m -n '__fish_m_using_command service' -a "stop" -d 'stop a service'
complete -f -c m -n '__fish_m_using_command service' -a "load" -d 'load a service'
complete -f -c m -n '__fish_m_using_command service' -a "unload" -d 'unload a service'
complete -f -c m -n '__fish_m_using_command service' -a "help" -d 'Show help'

## XXX: Add completion for shutdown options
complete -f -c m -n '__fish_m_needs_command' -a shutdown -d 'Shutdown computer'
complete -f -c m -n '__fish_m_using_command shutdown' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a sleep -d 'Sleep computer'
complete -f -c m -n '__fish_m_using_command sleep' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a timezone -d 'Manage timezone'
complete -f -c m -n '__fish_m_using_command timezone' -a "list" -d 'list available timezones'
complete -f -c m -n '__fish_m_using_command timezone' -a "set" -d 'set timezone'
complete -f -c m -n '__fish_m_using_command timezone' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a touchbar -d 'Manage touchbar'
complete -f -c m -n '__fish_m_using_command touchbar' -a "reset" -d 'reset the touchbar'
complete -f -c m -n '__fish_m_using_command touchbar' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a trash -d 'Manage the trash'
complete -f -c m -n '__fish_m_using_command trash' -a "status" -d 'get trash info'
complete -f -c m -n '__fish_m_using_command trash' -a "clean" -d 'clean trash'
complete -f -c m -n '__fish_m_using_command trash' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a user -d 'Manage users'
complete -f -c m -n '__fish_m_using_command user' -a "list" -d 'list users'
complete -f -c m -n '__fish_m_using_command user' -a "info" -d 'display user information'
complete -f -c m -n '__fish_m_using_command user' -a "create" -d 'create specified user (interactive)'
complete -f -c m -n '__fish_m_using_command user' -a "delete" -d 'delete specified user'
complete -f -c m -n '__fish_m_using_command user' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a update -d 'Manage macOS updates'
complete -f -c m -n '__fish_m_using_command update' -a "list" -d 'list available updates'
complete -f -c m -n '__fish_m_using_command update' -a "install" -d 'install update(s)'
complete -f -c m -n '__fish_m_using_command update' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a volume -d "Manage the sound's volume"
complete -f -c m -n '__fish_m_using_command volume' -a "up" -d 'increase the volume'
complete -f -c m -n '__fish_m_using_command volume' -a "down" -d 'decrease the volume'
complete -f -c m -n '__fish_m_using_command volume' -a "mute" -d 'set mute'
complete -f -c m -n '__fish_m_using_command volume' -a "unmute" -d 'unset mute'
complete -f -c m -n '__fish_m_using_command volume' -a "ismute" -d 'check the volume status'
complete -f -c m -n '__fish_m_using_command volume' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a vpn -d 'Basic vpn operations, start,stop, status, list'
complete -f -c m -n '__fish_m_using_command vpn' -a "list" -d 'list VPN connections'
complete -f -c m -n '__fish_m_using_command vpn' -a "start" -d 'start vpn connection'
complete -f -c m -n '__fish_m_using_command vpn' -a "stop" -d 'stop vpn connection'
complete -f -c m -n '__fish_m_using_command vpn' -a "status" -d 'status vpn connection'
complete -f -c m -n '__fish_m_using_command vpn' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a wallpaper -d 'Set the wallpaper'
complete -f -c m -n '__fish_m_using_command wallpaper' -a "help" -d 'Show help'

complete -f -c m -n '__fish_m_needs_command' -a wifi -d 'Manage the wifi'
complete -f -c m -n '__fish_m_using_command wifi' -a "status" -d 'wifi status'
complete -f -c m -n '__fish_m_using_command wifi' -a "scan" -d 'scan wifi'
complete -f -c m -n '__fish_m_using_command wifi' -a "showpassword" -d 'show wifi network password'
complete -f -c m -n '__fish_m_using_command wifi' -a "history" -d 'wifi connection history'
complete -f -c m -n '__fish_m_using_command wifi' -a "off" -d 'turn off your wifi'
complete -f -c m -n '__fish_m_using_command wifi' -a "on" -d 'turn on your wifi'
complete -f -c m -n '__fish_m_using_command wifi' -a "connect" -d 'join a wifi network'
complete -f -c m -n '__fish_m_using_command wifi' -a "help" -d 'Show help'


# vim: ft=sh ts=4 sw=4 softtabstop=4 expandtab
