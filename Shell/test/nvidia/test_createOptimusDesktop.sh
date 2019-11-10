#!/bin/bash

. ./../../common/common.sh

DESKTOP_FILE_PATH=/usr/local/share/optimus.desktop

createDesktopByCustomContent ${DESKTOP_FILE_PATH} '[Desktop Entry]\nType=Application\nName=Optimus\nExec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"\nNoDisplay=true\nX-GNOME-Autostart-Phase=DisplayServer'

unset DESKTOP_FILE_PATH