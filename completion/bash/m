# copy this file into /usr/local/etc/bash_completion.d/

_m_sub () {
    local $prev="$1"
    local subcommands=()
    case "$prev" in
        help)
            ;;
        battery)
            subcommands=(status help)
            ;;
        bluetooth)
            subcommands=(status on enable off disable help)
            ;;
        dir)
            subcommands=(tree size delete help)
            ;;
        disk)
            subcommands=(
                ls list fs filesystems info ejectall verify
                repair format reformat rename help
            )
            ;;
        display)
            subcommands=(status help)
            ;;
        dns)
            subcommands=(flush help)
            ;;
        dock)
            subcommands=(
                showdelay autohide magnification
                position addblankspace addrecentitems
                prune help
            )
            ;;
        finder)
            subcommands=(showhiddenfiles showextensions showdesktop help)
            ;;
        firewall)
            subcommands=(status enable disable add remove list help)
            ;;
        flightmode)
            subcommands=(on off help)
            ;;
        gatekeeper)
            subcommands=(status list enable disable create help)
            ;;
        group)
            subcommands=(list info adduser removeuser ismember help)
            ;;
        hostname)
            subcommands=(help)
            ;;
        info)
            subcommands=(help)
            ;;
        itunes)
            subcommands=(status play pause next prev mute unmute vol stop quit help)
            ;;
        lock)
            subcommands=(help)
            ;;
        network)
            subcommands=(ls location help)
            ;;
        nosleep)
            subcommands=(until help)
            ;;
        notification)
            subcommands=(showcenter help)
            ;;
        ntp)
            subcommands=(status enable disable set help)
            ;;
        printer)
            subcommands=(settings name queue drivers web help)
            ;;
        restart)
            subcommands=(-f help)
            ;;
        safeboot)
            subcommands=(status enable disable help)
            ;;
        screensaver)
            subcommands=(status askforpassword help)
            ;;
        service)
            subcommands=(
                --status-all --list --ls start stop load unload help
            )
            ;;
        shutdown)
            subcommands=(-f help)
            ;;
        sleep)
            subcommands=( help)
            ;;
        timezone)
            subcommands=(ls set help)
            ;;
        touchbar)
            subcommands=(reset help)
            ;;
        trash)
            subcommands=(status clean help)
            ;;
        user)
            subcommands=(ls info create delete help)
            ;;
        update)
            subcommands=(ls install help)
            ;;
        volume)
            subcommands=(up down mute unmute ismute help)
            ;;
        vpn)
            subcommands=(list status stop start help)
            ;;
        wallpaper)
            subcommands=(help *)
            ;;
        wifi)
            subcommands=(
                status scan showpassword history on off connect help
            )
            ;;
    esac
    COMPREPLY=( $( compgen -W "${subcommands[*]}" -- $cur  )  )
}

_m_dir() {
    local prev="$1"
    local choices=()

    case "$prev" in
        tree)
            choices=(*)
            ;;
        size)
            choices=(*)
            ;;
        delete)
            choices=(empty dsfiles)
            ;;
        empty)
            choices=(*)
            ;;
    esac
    COMPREPLY=( $( compgen -W "${choices[*]}" -- $cur  )  )
}

_m_disk() {
    local prev="$1"
    local sub="$2"
    local choices=()

    case "$sub" in
        ls|list|info|reformat)
            [[ $COMP_CWORD == 3 ]] && choices=(*)
            ;;
        verify|repair)
            [[ $COMP_CWORD == 3 ]] && choices=(volume disk)
            [[ $COMP_CWORD == 4 ]] && choices=(*)
            ;;
        format)
            if [[ $COMP_CWORD == 3 ]]; then
                choices=(ExFAT JHFS+ MS-DOS volume)
            else
                case $COMP_CWORD in
                    4)
                        [[ ${COMP_WORDS[3]} == "volume" ]] && choices=(ExFAT JHFS+ MS-DOS)
                        ;;
                    5)
                        [[ ${COMP_WORDS[3]} == "MS-DOS" || \
                            ${COMP_WORDS[3]} == "ExFAT" || \
                            ${COMP_WORDS[3]} == "JHFS+" ]] && choices=(*)
                        ;;
                    6)
                        [[ ${COMP_WORDS[3]} == "volume" ]] && choices=(*)
                        ;;
                esac
            fi
            ;;
        rename)
            if [[ $COMP_CWORD == 3 ]]; then
                choices=(
                    $(
                        m disk ls \
                        | grep -E '^ +[0-9]:' \
                        | sed -E 's/^.+[0-9] (B|.B) +//'
                    )
                )
            fi
            ;;
    esac
    COMPREPLY=( $( compgen -W "${choices[*]}" -- $cur  )  )
}


_m_dock() {
    local prev="$1"
    local sub="$2"
    local choices=()

    case "$sub" in
        autohide)
            [[ $COMP_CWORD == 3 ]] && choices=(YES NO)
            ;;
        magnification)
            [[ $COMP_CWORD == 3 ]] && choices=(YES NO)
            ;;
        position)
            [[ $COMP_CWORD == 3 ]] && choices=(BOTTOM LEFT RIGHT)
            ;;
    esac
    COMPREPLY=( $( compgen -W "${choices[*]}" -- $cur  )  )
}

_m () {
    local cur
    local commands=(
        help battery bluetooth dir disk dns dock finder firewall flightmode gatekeeper group hostname
        info itunes lock network nosleep notification ntp printer restart safeboot screensaver service
        shutdown sleep timezone touchbar trash user update volume vpn wallpaper wifi
    )

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case "$COMP_CWORD" in
        1)
            COMPREPLY=( $( compgen -W "${commands[*]}" -- $cur  )  )
            ;;
        2)
            _m_sub "$prev"
            ;;
        *)
            cmd=${COMP_WORDS[1]}
            sub=${COMP_WORDS[2]}
            case "$cmd" in
                dir)
                    _m_dir "$prev"
                    ;;
                disk)
                    _m_disk "$prev" "$sub"
                    ;;
                dock)
                    _m_dock "$prev" "$sub"
                    ;;
                finder)
                    [[ $COMP_CWORD == 3 ]] \
                        && COMPREPLY=($(compgen -W "YES NO" -- $cur))
                    ;;
                firewall)
                    local _tmp=(*)
                    [[ $sub == "add" || $sub == "remove" && $COMP_CWORD -lt 5 ]] \
                        && COMPREPLY=($(compgen -W "${_tmp[*]}" -- $cur))
                    ;;
                gatekeeper)
                    if [[ \
                        $sub == "create"
                        && $COMP_CWORD -gt 3
                        && $COMP_CWORD -lt 5
                    ]]; then
                        local _tmp=(*)
                        COMPREPLY=($(compgen -W "${_tmp[*]}" -- $cur))
                    fi
                    ;;
                network)
                    if [[ $sub == "location" ]]; then
                        if [[ $COMP_CWORD == 3 ]]; then
                            local _tmp=(create delete switch)
                            COMPREPLY=($(compgen -W "${_tmp[*]}" -- $cur))
                        fi
                    fi
                    ;;
                nosleep)
                    local _tmp=(*)
                    [[ $COMP_CWORD == 3 ]] \
                        && COMPREPLY=($(compgen -W "${_tmp[*]}" -- $cur))
                    ;;
                screensaver)
                    [[ $sub == "askforpassword" && $COMP_CWORD == 3 ]] \
                        && COMPREPLY=($(compgen -W "YES NO" -- $cur))
                    ;;
            esac
            ;;
    esac

}

#complete -F _m m
complete -o bashdefault -o default -F _m m

# vim: ts=4 sw=4 softtabstop=4 expandtab ft=sh
