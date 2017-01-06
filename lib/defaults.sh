_mcli_read() {
    local domain="$1"
    local key="$2"
    local sudo="$3"

    [ -n "${domain}" ] && [ -n "${key}" ] || return 1
    [[ -n "${sudo}" ]] && sudo="sudo"

    echo "$(${sudo} defaults read "${domain}" "${key}" 2> /dev/null)"
}

_mcli_read_boolean_as_yes_no() {
    local value="$(_mcli_read $@)"

    case "${value}" in
        0|[nN][oO]|[fF][aA][lL][sS][eE])
            echo "NO"
            ;;
        1|[yY][eE][sS]|[tT][rU][eE])
            echo "YES"
            ;;
    esac
}

_mcli_read_number() {
    local value="$(_mcli_read $@)"

    echo "${value}"
}

_mcli_read_inverted_boolean() {
    local value="$(_mcli_read_boolean $@)"

    if [[ "${value}" == "YES" ]]; then
        echo "NO"
    else
        echo "YES"
    fi
}
