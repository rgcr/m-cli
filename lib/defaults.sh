_mcli_read() {
    local domain="$1"
    local key="$2"
    local scope="${3:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$4"

    [ -n "${domain}" ] && [ -n "${key}" ] || return 1
    [[ -n "${sudo}" ]] && sudo="sudo"

    ${sudo} defaults ${scope_option} read "${domain}" "${key}" 2> /dev/null
}

_mcli_read_boolean_as_yes_no() {
    local value="$(_mcli_read "$@")"

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
    local value="$(_mcli_read "$@")"

    echo "${value}"
}

_mcli_read_string() {
    local value="$(_mcli_read "$@")"

    echo "${value}"
}

_mcli_read_inverted_boolean() {
    local value="$(_mcli_read_boolean_as_yes_no "$@")"

    if [[ "${value}" == "YES" ]]; then
        echo "NO"
    elif [[ "${value}" == "NO" ]]; then
        echo "YES"
    else
        echo "ERROR"
    fi
}

_mcli_invert_boolean() {
    case "$1" in
        0|[nN][oO]|[oO][fF][fF]|[fF][aA][lL][sS][eE])
            echo "YES"
            ;;
        1|[yY][eE][sS]|[oO][nN]|[tT][rR][rU][eE])
            echo "NO"
            ;;
    esac
}

_mcli_defaults_yes_no_to_integer() {
    _mcli_defaults_yes_no_to_type "integer" "convert_yes_no_to_integer" "$@"
}

_mcli_defaults_yes_no_to_boolean() {
    _mcli_defaults_yes_no_to_type "boolean" "convert_yes_no_to_boolean" "$@"
}

_mcli_defaults_yes_no_to_inverted_boolean() {
    local result="$(_mcli_defaults_yes_no_to_type "boolean" "convert_yes_no_to_inverted_boolean" "$@")"

    _mcli_invert_boolean "${result}"
}

_mcli_defaults_number() {
    local domain="$1"
    local key="$2"
    local new_value="$3"
    local scope="${4:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$5"
    local transformed="$(_mcli_convert_number_to_number "${new_value}")"

    case "${transformed}" in
        [0-9]*[.][0-9]*)
            ${sudo} defaults ${scope_option} write "${domain}" "${key}" -float "${transformed}"
            ;;
        [0-9]*)
            ${sudo} defaults ${scope_option} write "${domain}" "${key}" -int "${transformed}"
            ;;
    esac

    _mcli_read_number "${domain}" "${key}" "${scope}" "${sudo}"
}

_mcli_defaults_string() {
    local domain="$1"
    local key="$2"
    local new_value="$3"
    local scope="${4:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$4"

    if [ -n "${new_value}" ]; then
      ${sudo} defaults ${scope_option} write "${domain}" "${key}" -string "${new_value}"
    fi

    _mcli_read_string "${domain}" "${key}" "${scope}" "${sudo}"
}

_mcli_defaults_delete() {
    local domain="$1"
    local key="$2"
    local scope="${3:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$4"

    if [ -n "${sudo}" ]; then
      ${sudo} sh -c "defaults ${scope_option} delete '${domain}' '${key}' 2> /dev/null"
    else
      defaults delete "${domain}" "${key}" 2> /dev/null
    fi
}

# shellcheck disable=SC2086
_mcli_defaults_yes_no_to_type() {
    local type="$1"
    local transformer="$2"
    local domain="$3"
    local key="$4"
    local new_value="$5"
    local scope="${6:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$7"
    local transformed="$(_mcli_${transformer} "${new_value}")"

    if [ -n "${new_value}" ] && [[ "${transformed}" != "ERROR" ]]; then
      ${sudo} defaults ${scope_option} write "${domain}" "${key}" -${type} "${transformed}"
    fi

    if [[ "${transformed}" != "ERROR" ]]; then
      _mcli_read_boolean_as_yes_no "${domain}" "${key}" "${scope}" "${sudo}"
    else
      echo "ERROR"
    fi
}

_mcli_defaults_yes_no_to_array_item() {
    local choice="$(_mcli_convert_yes_no_to_boolean "$1")"
    local file="$2"
    local array="$3"
    local item="$4"
    local scope="${5:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$6"

    if [[ "${choice}" == 'true' ]]; then
      _mcli_defaults_add_array_item "${file}" "${array}" "${item}" "${scope}" "${sudo}"
    else
      _mcli_defaults_delete_array_item "${file}" "${array}" "${item}" "${scope}" "${sudo}"
    fi
}

_mcli_defaults_add_array_item() {
    local file="$1"
    local array="$2"
    local item="$3"
    local scope="${4:-"global"}"
    local scope_option="$(_mcli_defaults_scope_option "${scope}")"
    local sudo="$5"

    index="$(${sudo} /usr/libexec/PlistBuddy -c "Print ${array}" "${file}" | sed -n '2,100000p' | sed '$d' | sed "s/^[ \t]*//" | grep --line-regexp --line-number --regexp="${item}" | awk -F ":" '{print $1}')"

    [ -z "${index}" ] && ${sudo} /usr/libexec/PlistBuddy -c "Add :${array}:0 string '${item}'" "${file}"
}

_mcli_defaults_delete_array_item() {
    local file="$1"
    local array="$2"
    local item="$3"
    local sudo="$4"

    index="$(${sudo} /usr/libexec/PlistBuddy -c "Print ${array}" "${file}" | sed -n '2,100000p' | sed '$d' | sed "s/^[ \t]*//" | grep --line-regexp --line-number --regexp="${item}" | awk -F ":" '{print $1}')"

    if [ -n "${index}" ]; then
      index=$((index - 1))

      ${sudo} /usr/libexec/PlistBuddy -c "Delete :${array}:${index}" "${file}"
    fi
}

_mcli_defaults_scope_option() {
    local scope="${1:-"global"}"

    [[ "${scope}" != 'global' ]] && [[ "${scope}" != 'host' ]] && echo "Invalid scope '${scope}'" && exit 1

    [[ "${scope}" == 'host' ]] && echo '-currentHost'
}
