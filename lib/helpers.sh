_mcli_print_command_status() {
    local command="$1"
    local subcommand="$1"
    local value="$1"

    echo "${command} - ${subcommand}: ${value}"
}
