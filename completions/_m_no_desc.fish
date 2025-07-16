function __m_list_commands
    set -l mpath (dirname (status --current-filename))
    for plugin in $mpath/../plugins/*
        if test -f $plugin
            echo (basename $plugin)
        end
    end
end

function __m_get_options_for_command
    set -l cmd $argv[1]
    if test -n "$cmd"
        # Llama al subcomando con --help y extrae las opciones que comienzan con --
        m $cmd --help 2>/dev/null | string match --regex '^\s*(--[a-zA-Z0-9-]+)' | string trim
    end
end

# Autocompletado para el comando principal
complete -c m -f -n '__fish_use_subcommand' -a '(__m_list_commands)' -d 'm subcommands'

# Autocompletado para las opciones globales
complete -c m -l update -d 'Update m-cli'
complete -c m -l uninstall -d 'Uninstall m-cli'

# Autocompletado dinámico para cada subcomando
for cmd in (__m_list_commands)
    complete -c m -n "__fish_seen_subcommand_from $cmd" -a "(__m_get_options_for_command $cmd)" -d "Options for $cmd"
end
