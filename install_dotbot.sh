#!/usr/bin/env bash
#
# Installs user-level dotbot symlinks and then runs install_dotbot_system.sh
# via sudo for system-level symlinks (will prompt for password if needed).
#
#   ./install_dotbot.sh

set -e

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

sudo "${BASEDIR}/install_dotbot_system.sh"
