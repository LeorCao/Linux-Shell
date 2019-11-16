# !bin/bash

source ../common/common.sh

NVIDIA = nvidia-435xx-utils

# 安装 nvidia utils
sudo pacman -S ${NVIDIA}

checkError $? "Instaling nvidia utils failed!"

# 安装 lightdm 与 gdm
sudo pacman -S lightdm gdm

checkError $? "Instaling lightdm and gdm failed!"

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



# 配置 nvidia.conf
sudo rm /etc/modprobe.d/mhwd-gpu.conf
sudo rm /etc/modprobe.d/mhwd-nvidia.conf

export NVIDIA_CONF_NAME=nvidia.conf
export NVIDIA_CONF_PATH=/etc/modprobe.d/

# content : 
# blacklist nouveau
# blacklist nvidiafb
# blacklist rivafb

forceCreateAndWriteContToFile "${NVIDIA_CONF_PATH}${NVIDIA_CONF_NAME}" 'blacklist nouveau\nblacklist nvidiafb\nblacklist rivafb'

unset NVIDIA_CONF_NAME
unset NVIDIA_CONF_PATH



# 配置 nvidia-drm.conf

# /etc/modprobe.d/nvidia-drm.conf
export NVIDIA_DRM_FILE_NAME=nvidia-drm.conf
export NVIDIA_DRM_FILE_PATH=/etc/modprobe.d/

# Content :
# options nvidia_drm modeset=1

forceCreateAndWriteContToFile "${NVIDIA_DRM_FILE_PATH}${NVIDIA_DRM_FILE_NAME}" 'options nvidia_drm modeset=1'

unset NVIDIA_DRM_FILE_NAME
unset NVIDIA_DRM_FILE_PATH



# 配置 optimus.sh

# /usr/local/bin/optimus.sh
export OPTIMUS_SHELL_NAME=optimus.sh
export OPTIMUS_SHELL_PATH=/usr/local/bin/

# Content :
# #!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

forceCreateAndWriteContToFile "${OPTIMUS_SHELL_PATH}${OPTIMUS_SHELL_NAME}" '#!/bin/sh\n\nxrandr --setprovideroutputsource modesetting NVIDIA-0\nxrandr --auto'

sudo chmod a+rx ${OPTIMUS_SHELL_PATH}${OPTIMUS_SHELL_NAME}

unset OPTIMUS_SHELL_NAME
unset OPTIMUS_SHELL_PATH



# 修改 lightdm.conf

export LIGHTDM_FILE=/etc/lightdm/lightdm.conf

# lineNum=`sed -n "/# display-setup-script/=" ${LIGHTDM_FILE}`
# echo ${lineNum}

editReplaceFileByLine "${LIGHTDM_FILE}" "# display-setup-script" 'display-setup-script=/usr/local/bin/optimus.sh'

unset LIGHTDM_FILE



# 创建 optimus.desktop

# /usr/local/share/optimus.desktop
export DESKTOP_FILE_PATH=/usr/local/share/optimus.desktop

forceCreateAndWriteContToFile ${DESKTOP_FILE_PATH} '[Desktop Entry]\nType=Application\nName=Optimus\nExec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"\nNoDisplay=true\nX-GNOME-Autostart-Phase=DisplayServer'

unset DESKTOP_FILE_PATH



# 添加链接

sudo ln -s /usr/local/share/optimus.desktop /usr/share/gdm/greeter/autostart/optimus.desktop
sudo ln -s /usr/local/share/optimus.desktop /etc/xdg/autostart/optimus.desktop




# 创建 Xsetup

export XSETUP_FILE_PATH=/usr/share/sddm/scripts/Xsetup

forceCreateAndWriteContToFile "${XSETUP_FILE_PATH}" "#!/bin/sh\n\nxrandr --setprovideroutputsource modesetting NVIDIA-0\nxrandr --auto"

unset XSETUP_FILE_PATH

read -p "install success，must be restart system, do know? : [y/n]" options

if [ ${options} -eq "y" ]; then
    reboot
fi
