#!/usr/bin/env bash

[ -L ${0} ] && pushd $(readlink $0 | xargs dirname) >/dev/null \
    || pushd $(dirname ${0}) >/dev/null
export MPATH=$(pwd -P)
popd >/dev/null


confirm () {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case ${response} in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

update_mcli(){
    INSTALL_DIR=${MPATH} ${MPATH}/install.sh
}

uninstall_mcli(){
    confirm "Do you want to uninstall m-cli? [y/n]: " \
        && sudo rm -rf ${MPATH} 2>/dev/null \
        && sudo rm -f "/usr/local/bin/m" 2>/dev/null \
        && echo "Done !"
}


usage(){

    cat <<__EOF__

  Swiss Army Knife for macOS ! 


usage:  m [OPTIONS] COMMAND [help]

    OPTIONS
        --update        update m-cli to the latest version
        --uninstall     uninstall m-cli

    COMMANDS:
        help
__EOF__

    for i in ${MPATH}/plugins/*; do
        [ ! -L "$i" -a -f "$i"  ] && echo "        ${i##*/}"
    done

    [ "${COMMAND}" == "help" ] && exit 0 || exit 1
}


case $1 in
    --update)
        update_mcli && exit 0
        ;;
    --uninstall)
        uninstall_mcli && exit 0
        ;;
esac


COMMAND=$1; shift;

[ ! -f ${MPATH}/plugins/${COMMAND} ] && usage
${MPATH}/plugins/${COMMAND} "$@"



# vim: ts=4 sw=4 softtabstop=4 expandtab
