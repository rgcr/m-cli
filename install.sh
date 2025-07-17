#!/usr/bin/env bash

PKG="m-cli"
GIT_URL="https://github.com/rgcr/m-cli.git"
INSTALL_DIR="${INSTALL_DIR:-${HOME}/.local/opt/m-cli}"
BIN_DIR="${BIN_DIR:-${HOME}/.local/bin}"
LINK_NAME="m"

has(){
    command -v "$1" &>/dev/null
}

die() {
    echo >&2 "ERROR: ${@}"
    exit 1
}

infomsg() {
    echo "INFO: ${@}"
}

ensure_dirs() {
    mkdir -p ${HOME}/.local/opt
    mkdir -p ${HOME}/.local/bin
}

prechecks(){
    if ! has "git"; then
        die "git is not installed. Please install git before running this script."
    fi
    ensure_dirs
}

install_or_update_from_git(){
    if [ -e "${INSTALL_DIR}" ]; then
        #  package is installed, we just update it
        infomsg "${PKG} is already installed at ${INSTALL_DIR}"
        infomsg "Updating ${PKG} from git"

        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" fetch --depth=1 || \
            die "Failed to fetch changes => ${GIT_URL}"

        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" reset --hard origin/master || \
            die "Failed to reset changes => ${GIT_URL}"
    else
        # package is not installed, we clone it
        infomsg "Downloading ${PKG} from git to ${INSTALL_DIR}"
        command git clone --depth 1 ${GIT_URL} ${INSTALL_DIR} || \
            die "Failed to clone => ${GIT_URL}"
    fi
}

create_symlink() {
    if [ ! -f "${INSTALL_DIR}/m" ]; then
        die "Executable not found at ${INSTALL_DIR}/m"
    fi
    infomsg "Creating symlink ${BIN_DIR}/${LINK_NAME} -> ${INSTALL_DIR}/m"
    ln -sf "${INSTALL_DIR}/m" "${BIN_DIR}/${LINK_NAME}" || die "Failed to create symlink"
}


caveats() {
cat <<_EOF_


NOTE:

    Please ensure that ${BIN_DIR} is in your PATH.

    You can add it by running:
      export PATH="${BIN_DIR}:\$PATH"

    Or by adding the above line to your shell's configuration file (e.g., ~/.bashrc, ~/.zshrc).

    Some commands are executed with 'sudo' internally because they require root privileges to work correctly.
    Therefore, make sure you have sudo privileges to use this tool effectively.

_EOF_
}

__uninstall_mcli() {
    if [ ! -e "${INSTALL_DIR}" ]; then
        infomsg "${PKG} is not installed, nothing to do."
        return 0
    fi
    rm -rf "${INSTALL_DIR}" 2>/dev/null || die "Failed to remove ${INSTALL_DIR}"
    rm -f "${BIN_DIR}/${LINK_NAME}" || die "Failed to remove symlink ${BIN_DIR}/${LINK_NAME}"
}

usage(){
cat <<_EOF_
Usage: install.sh [--reinstall|--help]

Installs or updates ${PKG} in ${INSTALL_DIR} and creates a symlink in ${BIN_DIR}.

Options:
    --help        Show this help message
    --reinstall   Force reinstallation of ${PKG} even if it is already installed.
_EOF_
}

main(){
    prechecks

    local force_install=0
    case "$1" in
        --help|-h)
            usage && exit 0
            ;;
        --reinstall)
            force_install=1
            ;;
    esac

    if [ ${force_install} -ne 0 ]; then
        __uninstall_mcli
    fi

    install_or_update_from_git
    create_symlink
    infomsg "${PKG} has been successfully installed in ${INSTALL_DIR}"

    caveats
}

main $@
