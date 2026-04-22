#!/usr/bin/env bash
#
# Installs system-level dotbot symlinks that require root permissions (e.g. /etc/).
# Called automatically by install_dotbot.sh via sudo, but can also be run directly:
#
#   sudo ./install_dotbot_system.sh

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Error: this script must be run with sudo" >&2
  exit 1
fi

CONFIG="install.system.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
