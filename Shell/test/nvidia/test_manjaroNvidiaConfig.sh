#!/bin/bash

. ./../../common/common.sh

# 测试创建文件
export OPTIMUS_PATH=/etc/X11/xorg.conf.d/
export OPTIMUS_OLD_REMOVE_FILE=90-mhwd.conf
export OPTIMUS_FILE_NAME=optimus.conf

sudo rm -f ${OPTIMUS_PATH}${OPTIMUS_OLD_REMOVE_FILE}
sudo rm -f ${OPTIMUS_PATH}${OPTIMUS_FILE_NAME}

# 创建 optimus.conf
forceCreateAndWriteContToFile "${OPTIMUS_PATH}${OPTIMUS_FILE_NAME}" 'Section "Module"\n\tLoad "modesetting"\nEndSection\n\nSection "Device"\n\tIdentifier "nvidia"\n\tDriver "nvidia"\n\tBusID "PCI:1:0:0"\n\tOption "DPI" "96 x 96"\n\tOption "AllowEmptyInitialConfiguration"\nEndSection'

unset OPTIMUS_PATH
unset OPTIMUS_OLD_REMOVE_FILE
unset OPTIMUS_FILE_NAME