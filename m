#!/bin/sh

pushd `dirname $0` > /dev/null
MPATH=`pwd -P`
popd > /dev/null

. ${MPATH}/lib/colors.sh
. ${MPATH}/lib/functions.sh


usage(){

    cat <<__EOF__

  Swiss Army Knife for Mac OS X ! 


usage:  m [OPTIONS] COMMAND [help]

    OPTIONS
        --update        update m-cli to the last version
        --uninstall     uninstall m-cli

    COMMANDS:
        help
__EOF__

    for i in ${MPATH}/plugins/*; do
        [ ! -L "$i" -a -f "$i"  ] && echo "        ${i##*/}"
    done
    exit 1
}

case $1 in
    --update)
        ${MPATH}/install.sh
        exit 0
        ;;
    --uninstall)
        confirm "Do you want to uninstall m-cli? [y/n]: " && rm -rf ${MPATH} 2>/dev/null && echo "Done !"
        exit 0
        ;;
esac


COMMAND=$1; shift;

[ ! -f ${MPATH}/plugins/${COMMAND} ] && usage
${MPATH}/plugins/${COMMAND} $@



# vim: set ts=4 sw=4 softtabstop=4 expandtab

