_mcli_print_command_status() {
    local command="$1"
    local subcommand="$1"
    local value="$1"

    echo "${command} - ${subcommand}: ${value}"
}

_mcli_yes_no_to_boolean() {
    local choice="$1"

    case "${choice}" in
        1|[yY][eE][sS]|[tT][rU][eE])
            echo "true"
            ;;
        0|[nN][oO]|[fF][aA][lL][sS][eE])
            echo "false"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_exit_status_to_enabled_disabled() {
    local command="$1"

    if eval("${command} &> /dev/null"); then
      echo "enabled"
    else
      echo "disabled"
    fi
}

_mcli_yes_no_to_load_unload() {
    local choice="$1"

    case "${choice}" in
        1|[yY][eE][sS]|[tT][rU][eE])
            echo "load"
            ;;
        0|[nN][oO]|[fF][aA][lL][sS][eE])
            echo "unload"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_yes_no_to_inverted_boolean() {
    local choice="$(_mcli_yes_no_to_boolean $@)"

    if [[ "${choice}" == "true" ]]; then
        echo "false"
    else
        echo "true"
    fi
}

_mcli_yes_no_to_yes_no() {
    local choice="$1"

    case "${choice}" in
        1|[yY][eE][sS]|[tT][rU][eE])
            echo "YES"
            ;;
        0|[nN][oO]|[fF][aA][lL][sS][eE])
            echo "NO"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}

_mcli_yes_no_to_integer() {
    local choice="$1"

    case "${choice}" in
        1|[yY][eE][sS]|[tT][rU][eE])
            echo "1"
            ;;
        0|[nN][oO]|[fF][aA][lL][sS][eE])
            echo "0"
            ;;
        *)
            echo "ERROR"
            ;;
    esac
}
