_m() {
  local cur prev words cword
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  words=("${COMP_WORDS[@]}")
  cword=$COMP_CWORD

  local PLUGINS_DIR="${BASH_SOURCE[0]%/*}/plugins"

  # Subcommand completion
  if [[ $cword -eq 1 ]]; then
    local subcommands=()
    if [[ -d "$PLUGINS_DIR" ]]; then
      for f in "$PLUGINS_DIR"/*; do
        [[ -f "$f" && -x "$f" ]] && subcommands+=("$(basename "$f")")
      done
    fi
    COMPREPLY=( $(compgen -W "${subcommands[*]}" -- "$cur") )
    return
  fi

  local subcommand="${words[1]}"
  local plugin_script="${PLUGINS_DIR}/${subcommand}"

  [[ ! -f "$plugin_script" ]] && return

  # Get help text from plugin
  local help_text
  help_text="$("$plugin_script" --help 2>/dev/null || "$plugin_script" help 2>/dev/null)"

  local options=()
  declare -A opts_with_vals

  # Parse options and possible values
  while read -r line; do
    if [[ $line =~ ^[[:space:]]*--[a-zA-Z0-9_-]+ ]]; then
      local opt
      opt=$(echo "$line" | grep -o -- '--[a-zA-Z0-9_-]\+')
      options+=("$opt")
      # Parse <val1|val2>
      local vals
      vals=$(echo "$line" | grep -o '<[^>]*>' | tr -d '<>' | tr '|' ' ')
      if [[ -n $vals ]]; then
        opts_with_vals[$opt]="$vals"
      fi
    fi
  done <<< "$help_text"

  # If current word starts with --
  if [[ "$cur" == --* ]]; then
    COMPREPLY=( $(compgen -W "${options[*]}" -- "$cur") )
    return
  fi

  # If previous word is an option that accepts values
  if [[ -n "${opts_with_vals[$prev]}" ]]; then
    COMPREPLY=( $(compgen -W "${opts_with_vals[$prev]}" -- "$cur") )
    return
  fi
}

complete -F _m m

