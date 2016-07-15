#!/bin/sh

PKG="m-cli"
GIT_URL="https://github.com/rgcr/m-cli.git"
INSTALL_DIR="${INSTALL_DIR:-/usr/local}"

has(){
    type "$1" > /dev/null 2>&1
}


install_from_git(){
    if [ -e "${INSTALL_DIR}/${PKG}" ]; then
        echo "${PKG} Is already installed"
        echo "Updating ${PKG} from git"
        command git --git-dir="${INSTALL_DIR}/${PKG}/.git" --work-tree="${INSTALL_DIR}/${PKG}" fetch --depth=1 || {
            echo >&2 "Failed to fetch changes => ${GIT_URL}"
            exit 1
        }
        command git --git-dir="${INSTALL_DIR}/${PKG}/.git" --work-tree="${INSTALL_DIR}/${PKG}" reset --hard origin/master || {
            echo >&2 "Failed to reset changes => ${GIT_URL}"
            exit 1
        }
    else
        echo "Downloading ${PKG} from git to ${INSTALL_DIR}"
        command git clone --depth 1 ${GIT_URL} ${INSTALL_DIR}/${PKG} || {
            echo >&2 "Failed to clone => ${GIT_URL}"
            exit 1
        }
        chmod -R 755 ${INSTALL_DIR}/${PKG}/lib  2>/dev/null
        chmod -R 755 ${INSTALL_DIR}/${PKG}/plugins 2>/dev/null
        chmod 755 ${INSTALL_DIR}/${PKG}/m 2>/dev/null
    fi
}


if has "git"; then
    install_from_git;
else
    echo >&2 "Failed to install, please install git before."
fi

if [ -f "${INSTALL_DIR}/${PKG}/m" ]; then

    echo "${INSTALL_DIR}/${PKG}" | sudo tee /etc/paths.d/m-cli >/dev/null 2>&1

    echo ""
    echo "Done!"

    if [ ! -f "/etc/paths.d/m-cli" ]; then
        cat<<__EOF__

    Please add the following line to your .bashrc or .zshrc or .profile:

    export PATH=\$PATH:${INSTALL_DIR}/${PKG}


__EOF__
    fi
else
    echo >&2 ""
    echo >&2 "Something went wrong. ${INSTALL_DIR}/${PKG}/m not found"
    echo >&2 ""
    exit 1
fi

# vim: set ts=4 sw=4 softtabstop=4 expandtab

