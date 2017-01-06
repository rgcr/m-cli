_mcli_read() {
    local domain="$1"
    local key="$2"
    local sudo="$3"

    [ -n "${domain}" ] && [ -n "${key}" ] || return 1
    [[ -n "${sudo}" ]] && sudo="sudo"

    echo "$(${sudo} defaults read "${domain}" "${key}")"
}

_mcli_read_boolean() {
    local value="$(_mcli_read $@)"

    if [ "${value}" -eq 1 ]; then
        echo "YES"
    else
        echo "NO"
    fi
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
