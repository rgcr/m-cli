#!/usr/bin/env bash

# Resolve script path, even if it's a symlink
SOURCE="${BASH_SOURCE[0]:-$0}"

while [ -L "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done

MCLI_PATH="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
# export MCLI_PATH


confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

get_version(){
    if ! command -v git >/dev/null 2>&1; then
        echo "m-cli version: unknown (git not found)"
        return 1
    fi

    local git_tag=$(git -C ${MCLI_PATH} describe --tags --exact-match HEAD 2>/dev/null)
    local git_hash=$(git -C ${MCLI_PATH} rev-parse --short HEAD 2>/dev/null)
    if [ -n "$TAG" ]; then
        echo "m-cli version: $git_tag ($git_hash)"
    else
        echo "m-cli version: $git_hash (not tagged)"
    fi
}

update_mcli(){
    confirm "Do you want to update m-cli? [y/n]: " || exit 0
    INSTALL_DIR=${MCLI_PATH} bash ${MCLI_PATH}/install.sh
}

uninstall_mcli(){
    confirm "Do you want to uninstall m-cli? [y/n]: " || exit 0
    sudo rm -rf ${MCLI_PATH} 2>/dev/null \
        sudo rm -f "/usr/local/bin/m" 2>/dev/null \
        sudo rm -f "${HOME}/.local/bin/m" 2>/dev/null \
        echo "Done !"
    }

usage(){
    cat <<__EOF__

  Swiss Army Knife for macOS ! 

Usage: m [Options] COMMAND [COMMAND_OPTIONS] [ARGS..]

Options:
  --help          Show this help message
  --update        Update 'm-cli' to the latest version
  --uninstall     Uninstall 'm-cli'
  --version       Show the version of 'm-cli'

COMMANDS:
__EOF__

    for i in "$MCLI_PATH"/plugins/*; do
        [ -f "$i" ] && [ ! -L "$i" ] && echo "    ${i##*/}"
    done
}

case $1 in
    --update)
        update_mcli && exit 0
        ;;
    --uninstall)
        uninstall_mcli && exit 0
        ;;
    --version)
        get_version && exit 0
        ;;
    --help)
        usage && exit 0
        ;;
esac


COMMAND=${1}
shift;

[ ! -f ${MCLI_PATH}/plugins/${COMMAND} ] && usage && exit 1

${MCLI_PATH}/plugins/${COMMAND} "$@"
