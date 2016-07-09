#!/bin/sh

. ${MPATH}/lib/colors.sh

_green_msg(){
    echo "${GREEN}$@${NC}"
}

_red_msg(){
    echo "${RED}$@${NC}"
}

_gray_msg(){
    echo "${GRAY}$@${NC}"
}

_is_function(){
    type $1 2>/dev/null | grep -i function > /dev/null && true
}

_die(){
    _red_msg $@;
    exit 1
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# vim: set ts=4 sw=4 softtabstop=4 expandtab
