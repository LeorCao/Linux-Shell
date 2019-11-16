#!/bin/bash

. ./../../common/common.sh

# /etc/modprobe.d/nvidia.conf

export NVIDIA_CONF_NAME=nvidia.conf
export NVIDIA_CONF_PATH=/etc/modprobe.d/

# content : 
# blacklist nouveau
# blacklist nvidiafb
# blacklist rivafb

forceCreateAndWriteContToFile "${NVIDIA_CONF_PATH}${NVIDIA_CONF_NAME}" 'blacklist nouveau\nblacklist nvidiafb\nblacklist rivafb'