#!/bin/bash

. ./../../common/common.sh

# 配置 nvidia-drm.conf

# /etc/modprobe.d/nvidia-drm.conf
export NVIDIA_DRM_FILE_NAME=nvidia-drm.conf
export NVIDIA_DRM_FILE_PATH=/etc/modprobe.d/

# Content :
# options nvidia_drm modeset=1

createFile "${NVIDIA_DRM_FILE_NAME}" "${NVIDIA_DRM_FILE_PATH}" 'options nvidia_drm modeset=1'

unset NVIDIA_DRM_FILE_NAME
unset NVIDIA_DRM_FILE_PATH
