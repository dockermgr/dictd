#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPNAME="dictd"
VERSION="202107311147-git"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#set opts

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202107311147-git
# @Author        : casjay
# @Contact       : casjay
# @License       : WTFPL
# @ReadME        : dockermgr --help
# @Copyright     : Copyright: (c) 2021 casjay, casjay
# @Created       : Saturday, Jul 31, 2021 11:47 EDT
# @File          : dictd
# @Description   : dictd docker container installer
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Import functions
CASJAYSDEVDIR="${CASJAYSDEVDIR:-/usr/local/share/CasjaysDev/scripts}"
SCRIPTSFUNCTDIR="${CASJAYSDEVDIR:-/usr/local/share/CasjaysDev/scripts}/functions"
SCRIPTSFUNCTFILE="${SCRIPTSAPPFUNCTFILE:-app-installer.bash}"
SCRIPTSFUNCTURL="${SCRIPTSAPPFUNCTURL:-https://github.com/dfmgr/installer/raw/$GIT_DEFAULT_BRANCH/functions}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ -f "$PWD/$SCRIPTSFUNCTFILE" ]; then
  . "$PWD/$SCRIPTSFUNCTFILE"
elif [ -f "$SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE" ]; then
  . "$SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE"
else
  echo "Can not load the functions file: $SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE" 1>&2
  exit 1
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
system_installdirs
__sudo() { if sudo -n true; then eval sudo "$*"; else eval "$*"; fi; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
printf_exit "This is currently a work in progress"

# Begin installer
APPNAME="dictd"
DOCKER_HUB_URL="casjaysdev/dictd"
dictd_SERVER_PORT="${dictd_SERVER_PORT:-2628}"
dictd_SERVER_HOST="${dictd_SERVER_HOST:-$(hostname -f 2>/dev/null)}"
REPO="${DOCKERMGRREPO:-https://github.com/dockermgr}/$APPNAME"
REPO_BRANCH="${GIT_REPO_BRANCH:-main}"
dictd_SERVER_TIMEZONE="${TZ:-${TIMEZONE:-America/New_York}}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if user_is_root; then
  APPDIR="$CASJAYSDEVDIR/$SCRIPTS_PREFIX/$APPNAME"
  INSTDIR="$CASJAYSDEVDIR/$SCRIPTS_PREFIX/$APPNAME"
  DATADIR="/srv/docker/$APPNAME"
else
  APPDIR="$HOME/.local/share/CasjaysDev/$SCRIPTS_PREFIX/$APPNAME"
  INSTDIR="$HOME/.local/share/CasjaysDev/$SCRIPTS_PREFIX/$APPNAME"
  DATADIR="$HOME/.local/share/srv/docker/$APPNAME"
fi
REPORAW="$REPO/raw/$REPO_BRANCH"
APPVERSION="$(__appversion "$REPORAW/version.txt")"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
__sudo mkdir -p "$DATADIR/data"
__sudo mkdir -p "$DATADIR/config"
__sudo chmod -Rf 777 "$DATADIR"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Require a version higher than
systemmgr_req_version "$APPVERSION"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Call the systemmgr function
dockermgr_install
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Script options IE: --help
show_optvars "$@"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Requires root - no point in continuing
#sudoreq "$0 $*" # sudo required
#sudorun # sudo optional
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Do not update - add --force to overwrite
#installer_noupdate "$@"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# initialize the installer
#dockermgr_run_init
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ -f "$INSTDIR/docker-compose.yml" ] && cmd_exists docker-compose; then
  printf_blue "Installing containers using docker compose"
  sed -i "s|REPLACE_DATADIR|$DATADIR" "$INSTDIR/docker-compose.yml"
  if cd "$INSTDIR"; then
    __sudo docker-compose pull &>/dev/null
    __sudo docker-compose up -d &>/dev/null
  fi
else
  if docker ps -a | grep -qsw "$APPNAME"; then
    __sudo docker stop "$APPNAME" &>/dev/null
    __sudo docker rm -f "$APPNAME" &>/dev/null
  fi
  __sudo docker run -d \
    --name="$APPNAME" \
    --hostname "$APPNAME" \
    --restart=unless-stopped \
    --privileged \
    -e TZ="$dictd_SERVER_TIMEZONE" \
    -p "$dictd_SERVER_PORT":2628 \
    "$DOCKER_HUB_URL" --verbose --log /var/log/dictd/dictd.log &>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if docker ps -a | grep -qs "$APPNAME"; then
  printf_blue "Service is available at: $dictd_SERVER_HOST:$dictd_SERVER_PORT"
else
  false
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End script
exit $?
