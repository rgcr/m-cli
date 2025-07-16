#!/usr/bin/env bash

set +x

_m() {
  local cur prev subcommands subcommand help_text options opts_with_vals values opts_array val_array

  # Directorio de plugins, ajustar si es necesario
  local PLUGINS_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/plugins"

  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # Si no hay subcomando aún, listar subcomandos
  if [[ $COMP_CWORD -eq 1 ]]; then
    subcommands=()
    # Listar archivos ejecutables en plugins
    if [[ -d "$PLUGINS_DIR" ]]; then
      for file in "$PLUGINS_DIR"/*; do
        [[ -f "$file" && -x "$file" ]] && subcommands+=("$(basename "$file")")
      done
    fi
    COMPREPLY=( $(compgen -W "${subcommands[*]}" -- "$cur") )
    return 0
  fi

  # Ya tenemos subcomando en COMP_WORDS[1]
  subcommand="${COMP_WORDS[1]}"
  local plugin_script="${PLUGINS_DIR}/${subcommand}"

  # Si el subcomando no existe, no completar más
  [[ ! -f "$plugin_script" ]] && return 0

  # Si completamos la primera opción o siguiente opciones, extraemos la ayuda
  # Ejecutar función help del plugin para obtener texto de ayuda
  # La idea es que el plugin soporte "help" para imprimir ayuda
  help_text="$("$plugin_script" --help 2>/dev/null || "$plugin_script" help 2>/dev/null)"

  # Extraemos opciones y posibles valores (simplificado)
  options=()
  declare -A opts_with_vals=()

  # Extraemos líneas que tengan opciones
  while IFS= read -r line; do
    # Buscamos líneas que contengan opciones: empiezan con espacios y --option
    if [[ $line =~ ^[[:space:]]*--[a-zA-Z0-9_-]+ ]]; then
      # Extraemos la opción
      opt=$(echo "$line" | grep -o -- '--[a-zA-Z0-9_-]\+')
      options+=("$opt")
      # Extraemos valores entre corchetes []
      vals=$(echo "$line" | grep -o '\[[^]]*\]' | tr -d '[]' | tr '|' ' ')
      if [[ -n $vals ]]; then
        opts_with_vals["$opt"]="$vals"
      fi
    fi
  done <<< "$help_text"

  # Completamos la opción (flags) cuando el cursor está en una opción
  if [[ $cur == --* ]]; then
    COMPREPLY=( $(compgen -W "${options[*]}" -- "$cur") )
    return 0
  fi

  # Si la palabra anterior es una opción que tiene valores, completar esos valores
  if [[ ${opts_with_vals[$prev]+_} ]]; then
    local vals="${opts_with_vals[$prev]}"
    COMPREPLY=( $(compgen -W "$vals" -- "$cur") )
    return 0
  fi

  # Si no se cumple nada, no completar nada
  return 0
}

complete -F _m m

