_mcli_read() {
    local domain="$1"
    local key="$2"
    local sudo="$3"

    [ -n "${domain}" ] && [ -n "${key}" ] || return 1
    [[ -n "${sudo}" ]] && sudo="sudo"

    ${sudo} defaults read "${domain}" "${key}" 2> /dev/null
}

_mcli_read_boolean_as_yes_no() {
    local value="$(_mcli_read $@)"

    case "${value}" in
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "NO"
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][rU][eE])
            echo "YES"
            ;;
    esac
}

_mcli_read_number() {
    local value="$(_mcli_read $@)"

    echo "${value}"
}

_mcli_read_string() {
    local value="$(_mcli_read $@)"

    echo "${value}"
}

_mcli_read_font() {
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

_mcli_defaults_yes_no_to_integer() {
    _mcli_defaults_yes_no_to_type "integer" "convert_yes_no_to_boolean" $@
}

_mcli_defaults_yes_no_to_boolean() {
    _mcli_defaults_yes_no_to_type "boolean" "convert_yes_no_to_boolean" $@
}

_mcli_defaults_yes_no_to_inverted_boolean() {
    _mcli_defaults_yes_no_to_type "boolean" "convert_yes_no_to_inverted_boolean" $@
}

_mcli_defaults_number() {
    local domain="$1"
    local key="$2"
    local new_value="$3"
    local sudo="$4"
    local transformed="$(_mcli_convert_number_to_number "${new_value}")"

    case "${transformed}" in
        [0-9][.][0-9])
            ${sudo} defaults write "${domain}" "${key}" -float "${transformed}"
            ;;
        [0-9]*)
            ${sudo} defaults write "${domain}" "${key}" -int "${transformed}"
            ;;
    esac

    _mcli_read_integer "${domain}" "${key}"
}

_mcli_defaults_font() {
    local domain="$1"
    local key="$2"
    local new_value="$3"
    local sudo="$4"

    if [ -n "${new_value}" ]; then
      ${sudo} defaults write "${domain}" "${key}" -font "${transformed}"
    fi

    _mcli_read_font "${domain}" "${key}"
}

_mcli_defaults_string() {
    local domain="$1"
    local key="$2"
    local new_value="$3"
    local sudo="$4"

    if [ -n "${new_value}" ]; then
      ${sudo} defaults write "${domain}" "${key}" -string "${transformed}"
    fi

    _mcli_read_string "${domain}" "${key}"
}

_mcli_defaults_delete() {
    local domain="$1"
    local key="$2"
    local sudo="$3"

    if [ -n "${sudo}" ]; then
      ${sudo} sh -c "defaults delete '${domain}' '${key}' 2> /dev/null"
    else
      defaults delete "${domain}" "${key}" 2> /dev/null
    fi
}

_mcli_defaults_yes_no_to_type() {
    local type="$1"
    local transformer="$2"
    local domain="$3"
    local key="$4"
    local new_value="$5"
    local sudo="$6"
    local transformed="$(_mcli_${transformer} "${new_value}")"

    if [ -n "${new_value}" ] && [[ "${transformed}" != "ERROR" ]]; then
      ${sudo} defaults write "${domain}" "${key}" -${type} "${transformed}"
    fi

    _mcli_read_boolean "${domain}" "${key}"
}
