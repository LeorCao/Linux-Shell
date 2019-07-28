# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-29 01:57
# Remarks     : Manjaro 配置切换国内镜像源

# 选择国内源
sudo pacman-mirrors -i -c China -m rank

# 添加 pacman 配置文件
sudo echo '[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

# 导入 GPG key
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring