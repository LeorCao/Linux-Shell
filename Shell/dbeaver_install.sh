#!/bin/bash

. ./common/common.sh

DLOAD_URL="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"

printPrefaceMsg

cd ~/Downloads

curl -L $DLOAD_URL -o dbeaver-ce.deb  || {printErrorEndMsg "Download DBeaver error!";exit}

sudo dpkg -i dbeaver.deb  || {printErrorEndMsg "Install DBeaver error!";exit}

printEndMsg

exit
