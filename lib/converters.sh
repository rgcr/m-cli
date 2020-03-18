#!/usr/bin/env bash

_mcli_convert_yes_no_to_boolean() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "true"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "false"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_on_off() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "on"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "off"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_enabled_disabled() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "enabled"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "disabled"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_enable_disable() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "enable"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "disable"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_exit_status_to_enabled_disabled() {
    local command="$1"

    if eval "${command} &> /dev/null" ; then
      echo "enabled"
    else
      echo "disabled"
    fi
}

_mcli_convert_yes_no_to_load_unload() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "load"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "unload"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_inverted_boolean() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "false"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "true"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_yes_no() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "YES"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "NO"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_yes_no_to_integer() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][uU][eE])
            echo "1"
            ;;
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "0"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_number_to_number() {
    local choice="$1"

    case "${choice}" in
        "")
            echo ""
            ;;
        [0-9]*[.][0-9]*)
            echo "${choice}"
            ;;
        [0-9]*)
            echo "${choice}"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_convert_string_to_initial_capital() {
    echo "${1^}"
}
