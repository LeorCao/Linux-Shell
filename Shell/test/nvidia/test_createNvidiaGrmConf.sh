#!/bin/bash

. ./../../common/common.sh

# 配置 nvidia-drm.conf

# /etc/modprobe.d/nvidia-drm.conf
export NVIDIA_DRM_FILE_NAME=nvidia-drm.conf
export NVIDIA_DRM_FILE_PATH=/etc/modprobe.d/

# Content :
# options nvidia_drm modeset=1

forceCreateAndWriteContToFile "${NVIDIA_DRM_FILE_PATH}${NVIDIA_DRM_FILE_NAME}" 'options nvidia_drm modeset=1'

unset NVIDIA_DRM_FILE_NAME
unset NVIDIA_DRM_FILE_PATH
