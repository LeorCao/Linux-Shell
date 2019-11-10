#!/bin/bash

. ./../../common/common.sh

# 创建 Xsetup

export XSETUP_FILE_PATH=/usr/share/sddm/scripts/Xsetup

createFileByPath "${XSETUP_FILE_PATH}" "#!/bin/sh\n\nxrandr --setprovideroutputsource modesetting NVIDIA-0\nxrandr --auto"

unset XSETUP_FILE_PATH