# ~/.config/fish/completions/m.fish

function __m_complete --description 'Completion function for m command'

    set -l cur (commandline -ct)
    set -l words (commandline -opc)
    set -l argc (count $words)

    # Get the directory where the script lives, then plugins dir
    set -l script_dir (dirname (status -f))
    set -l plugins_dir "$script_dir/plugins"

    # If no subcommand yet or second word is option-like, complete subcommands (plugins)
    if test $argc -le 1 -o (test $argc -ge 2; and string match -qr '^-' -- $words[2])
        if test -d $plugins_dir
            for plugin in $plugins_dir/*
                if test -f $plugin -a -x $plugin
                    echo (basename $plugin)
                end
            end
        end
        return
    end

    # Subcommand is the second word
    set -l subcommand $words[2]
    set -l plugin_script "$plugins_dir/$subcommand"

    if not test -f $plugin_script
        return
    end

    # Get help text from plugin
    set -l help_text
    set help_text ($plugin_script --help ^/dev/null; or $plugin_script help ^/dev/null)

    # Arrays to hold options, option keys, and their possible values
    set -l options
    set -l opts_keys
    set -l opts_vals

    # Parse help output line by line
    for line in $help_text
        if string match -r '^\s*--[a-zA-Z0-9_-]+' -- $line
            # Extract option name (e.g. --enable)
            set -l opt (string match -r -- '--[a-zA-Z0-9_-]+' -- $line)[1]
            # Extract possible values inside brackets [val1|val2]
            # set -l vals (string match -r '\[[^]]*\]' -- $line | string replace -r '\[|\]' '' | string replace '|' ' ')
            # Extract description by removing option and possible [values]
            # set -l pattern "^\\s*$opt(\\s*\\[[^]]*\\])?\\s*"
            # set -l desc (string replace -r $pattern '' -- $line)

            # FIXME: The above regexes are not working as expected, so we need to use a different approach
            # Extract possible values inside angle brackets <val1|val2>
            # set -l vals (string match -r '<[^>]*>' -- $line | string replace -r '<|>' '' | string replace '|' ' ')
            set -l vals (string match -r '<[^>]*>' -- $line)
            if test -n "$vals"
                set vals (string replace -r '<|>' '' -- $vals | string replace '|' ' ')
            end
            # FIXME: The above regexes are not working as expected, so we need to use a different approach
            # Extract description by removing option and possible <values>
            set -l pattern "^\\s*$opt(\\s*<[^>]*>)?\\s*"
            set -l desc (string replace -r $pattern '' -- $line)

            # Prepare tab char
            set -l tab (printf '\t')
            # Append option + real tab + description
            set options $options "$opt$tab$desc"

            if test -n "$vals"
                set opts_keys $opts_keys $opt
                set opts_vals $opts_vals $vals
            end
        end
    end

    # If current word starts with --
    if string match -q -- '--*' -- $cur
        # Complete options with descriptions
        for optdesc in $options
            echo $optdesc
        end
        return
    end

    # If previous word is an option expecting values, complete those values
    if test $argc -ge 2
        set -l prev $words[-1]
        for i in (seq (count $opts_keys))
            if test $opts_keys[$i] = $prev
                for val in (string split ' ' -- $opts_vals[$i])
                    echo $val
                end
                return
            end
        end
    end

end

# Register completion for command m
complete -c m -f -a "(__m_complete)"

