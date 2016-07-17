#!/bin/sh

PKG="m-cli"
GIT_URL="https://github.com/rgcr/m-cli.git"
INSTALL_DIR="${INSTALL_DIR}"


has(){
    type "$1" > /dev/null 2>&1
}


install_from_git(){
    [ -z "${INSTALL_DIR}" ] && INSTALL_DIR="/usr/local/${PKG}"
    if [ -e "${INSTALL_DIR}" ]; then
        echo "${PKG} Is already installed"
        echo "Updating ${PKG} from git"
        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" fetch --depth=1 || {
            echo >&2 "Failed to fetch changes => ${GIT_URL}"
            exit 1
        }
        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" reset --hard origin/master || {
            echo >&2 "Failed to reset changes => ${GIT_URL}"
            exit 1
        }
    else
        echo "Downloading ${PKG} from git to ${INSTALL_DIR}"
        command git clone --depth 1 ${GIT_URL} ${INSTALL_DIR} || {
            echo >&2 "Failed to clone => ${GIT_URL}"
            exit 1
        }
        chmod -R 755 ${INSTALL_DIR}/lib  2>/dev/null
        chmod -R 755 ${INSTALL_DIR}/plugins 2>/dev/null
        chmod 755 ${INSTALL_DIR}/m 2>/dev/null
        sudo ln -sf ${INSTALL_DIR}/m /usr/local/bin/m
    fi
}


if has "git"; then
    install_from_git;
else
    echo >&2 "Failed to install, please install git before."
fi

[ -z "${INSTALL_DIR}" ] && INSTALL_DIR="/usr/local/${PKG}"

if [ -f "${INSTALL_DIR}/m" ]; then
    echo ""
    echo "Done!"
else
    echo >&2 ""
    echo >&2 "Something went wrong. ${INSTALL_DIR}/m not found"
    echo >&2 ""
    exit 1
fi

# vim: set ts=4 sw=4 softtabstop=4 expandtab

