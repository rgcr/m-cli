#!/usr/bin/env bash

# Resolve script path, even if it's a symlink
SOURCE="${BASH_SOURCE[0]:-$0}"

while [ -L "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done

MPATH="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
# export MPATH


confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

update_mcli(){
    INSTALL_DIR=${MPATH} bash ${MPATH}/install.sh
}

uninstall_mcli(){
    confirm "Do you want to uninstall m-cli? [y/n]: " || exit 0
    sudo rm -rf ${MPATH} 2>/dev/null \
        sudo rm -f "/usr/local/bin/m" 2>/dev/null \
        sudo rm -f "${HOME}/.local/bin/m" 2>/dev/null \
        echo "Done !"
    }

usage(){
    cat <<__EOF__
  Swiss Army Knife for macOS ! 

Usage: m [OPTIONS] COMMAND [COMMAND_OPTIONS] [ARGS..]

Options:
  --help          Show this help message
  --update        Update 'm-cli' to the latest version
  --uninstall     Uninstall 'm-cli'


COMMANDS:
__EOF__

    for i in "$MPATH"/plugins/*; do
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
    --help)
        usage && exit 0
        ;;
esac


COMMAND=${1}
shift;

[ ! -f ${MPATH}/plugins/${COMMAND} ] && usage && exit 1

exec ${MPATH}/plugins/${COMMAND} "$@"
