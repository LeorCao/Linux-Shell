#!/bin/bash

. ./../../common/common.sh

export LIGHTDM_FILE=/etc/lightdm/lightdm.conf

# lineNum=`sed -n "/# display-setup-script/=" ${LIGHTDM_FILE}`
# echo ${lineNum}

editReplaceFileByLine "${LIGHTDM_FILE}" "# display-setup-script" 'display-setup-script=/usr/local/bin/optimus.sh'

unset LIGHTDM_FILE