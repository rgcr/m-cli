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
    echo >&2 "Error: ${@}"
    exit 1
}

prechecks(){
    if ! has "git"; then
        die "git is not installed. Please install git before running this script."
    fi
}

ensure_dirs() {
    mkdir -p ${HOME}/.local/opt
    mkdir -p ${HOME}/.local/bin
}

clone_or_update_repo(){
    if [ -e "${INSTALL_DIR}" ]; then
        #  package is installed, we just update it
        echo "${PKG} is already installed"
        echo "Updating ${PKG} from git"

        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" fetch --depth=1 || \
            die "Failed to fetch changes => ${GIT_URL}"

        command git --git-dir="${INSTALL_DIR}/.git" --work-tree="${INSTALL_DIR}" reset --hard origin/master || \
            die "Failed to reset changes => ${GIT_URL}"
    else
        # package is not installed, we clone it
        echo "Downloading ${PKG} from git to ${INSTALL_DIR}"
        command git clone --depth 1 ${GIT_URL} ${INSTALL_DIR} || \
            die "Failed to clone => ${GIT_URL}"
    fi
}

create_symlink() {
    if [ ! -f "${INSTALL_DIR}/m" ]; then
        die "Executable not found at ${INSTALL_DIR}/m"
    fi
    echo "Creating symlink ${BIN_DIR}/${LINK_NAME} -> ${INSTALL_DIR}/m"
    ln -sf "${INSTALL_DIR}/m" "${BIN_DIR}/${LINK_NAME}" || die "Failed to create symlink"
}


caveats() {
    echo "Please ensure that ${BIN_DIR} is in your PATH."
    echo "You can add it by running:"
    echo "  export PATH=\"${BIN_DIR}:\$PATH\""
    echo ""
    echo "Or by adding the above line to your shell's configuration file (e.g., ~/.bashrc, ~/.zshrc)."
    echo ""
    echo "Some commands are executed with 'sudo' internally because they require root privileges to work correctly."
    echo "Therefore, make sure you have sudo privileges to use this tool effectively."
    echo ""
}

main(){
    prechecks
    ensure_dir
    clone_or_update_repo
    create_symlink
    caveats
}

main $@
