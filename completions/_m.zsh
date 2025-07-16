#compdef m

_m() {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  local cur prev
  cur="${words[CURRENT]}"
  prev="${words[CURRENT-1]}"

  local PLUGINS_DIR="${0:a:h}/plugins"

  if (( CURRENT == 2 )); then
    local -a subcommands
    if [[ -d "$PLUGINS_DIR" ]]; then
      subcommands=()
      for f in "$PLUGINS_DIR"/*; do
        [[ -f "$f" && -x "$f" ]] && subcommands+=$(basename "$f")
      done
      _describe 'subcommand' subcommands
    fi
    return
  fi

  local subcommand="${words[2]}"
  local plugin_script="${PLUGINS_DIR}/${subcommand}"

  [[ ! -f "$plugin_script" ]] && return

  # run help to get options and values
  local help_text
  help_text="$("$plugin_script" --help 2>/dev/null || "$plugin_script" help 2>/dev/null)"

  local -a options
  typeset -A opts_with_vals opts_descriptions

  # parse the help text to extract options, descriptions and values
  while IFS= read -r line; do
    if [[ $line =~ ^[[:space:]]*--[a-zA-Z0-9_-]+ ]]; then
      local opt=$(echo "$line" | grep -o -- '--[a-zA-Z0-9_-]\+')
      # values between brackets
      # local vals=$(echo "$line" | grep -o '\[[^]]*\]' | tr -d '[]' | tr '|' ' ')
      # values between angle brackets
      local vals=$(echo "$line" | grep -o '<[^>]*>' | tr -d '<>' | tr '|' ' ')
      local desc=$(echo "$line" | sed -E "s/^ *$opt( *\[[^]]*\])? *//")
      options+=("$opt:$desc")
      if [[ -n $vals ]]; then
        opts_with_vals[$opt]="$vals"
      fi
      opts_descriptions[$opt]="$desc"
    fi
  done <<< "$help_text"

  # if cursor is writing an option (--*)
  if [[ "$cur" == --* ]]; then
    _describe "options" options
    return
  fi

  # if a previous word is an option that has values
  if [[ -n "${opts_with_vals[$prev]}" ]]; then
    local vals=(${(z)opts_with_vals[$prev]})
    _values "values" $vals
    return
  fi
}

_m "$@"

