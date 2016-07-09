#!/bin/sh

PKG="m-cli"
GIT_URL="https://github.com/rgcr/m-cli.git"
INSTALL_DIR="/usr/local"


has(){
    type "$1" > /dev/null 2>&1
}


install_from_git(){
    [ -e "${INSTALL_DIR}/${PKG}" ] && rm -rf "${INSTALL_DIR}/${PKG}" 2>/dev/null
    echo "Downloading ${PKG} from git to ${INSTALL_DIR}"
    command git clone --depth 1 ${GIT_URL} ${INSTALL_DIR}/${PKG} || {
        echo >&2 "Failed to clone."
        exit 1
    }
    chmod -R 755 ${INSTALL_DIR}/${PKG}/lib  2>/dev/null
    chmod -R 755 ${INSTALL_DIR}/${PKG}/plugins 2>/dev/null
    chmod -R 755 ${INSTALL_DIR}/${PKG}/m 2>/dev/null
}

#TODO: ADD CURL INSTALLATION METHOD
#install_from_curl(){
#}

if has "git"; then
    install_from_git;
#elif has "curl"; then
    #install_from_curl
else
    echo >&2 "Failed to install, please install git before."
fi

if [ -f "${INSTALL_DIR}/${PKG}/m" ]; then
    cat<<__EOF__


Installed successfully!

Please add the following line to your .bashrc or .zshrc or .profile:

export PATH=\$PATH:${INSTALL_DIR}/${PKG}


__EOF__
else
    echo >&2 ""
    echo >&2 "Something went wrong. ${INSTALL_DIR}/${PKG}/m not found"
    echo >&2 ""
    exit 1
fi

# vim: set ts=4 sw=4 softtabstop=4 expandtab

