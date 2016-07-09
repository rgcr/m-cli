#!/bin/sh

pushd `dirname $0` > /dev/null
MPATH=`pwd -P`
popd > /dev/null

. ${MPATH}/lib/colors.sh
. ${MPATH}/lib/functions.sh


usage(){

    cat <<__EOF__

  Swiss Army Knife for Mac OS X ! 


usage:  m COMMAND [help]

    COMMANDS:
        help
__EOF__

    for i in ${MPATH}/plugins/*; do
        echo "        ${i##*/}"
    done
    exit 1
}


COMMAND=$1; shift;

[ ! -f ${MPATH}/plugins/${COMMAND} ] && usage #_die "There is no command ${COMMAND}";
${MPATH}/plugins/${COMMAND} $@



# vim: set ts=4 sw=4 softtabstop=4 expandtab

