# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-29 01:57
# Remarks     : Manjaro 配置切换国内镜像源

# 选择国内源
sudo pacman-mirrors -i -c China -m rank

# 各种国内源
# 浙大
# [archlinuxcn]
# Server = https://mirrors.zju.edu.cn/archlinuxcn/$arch

# 中科大
# [archlinuxcn]
# Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

# 清华
# [archlinuxcn]
# Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch

# 添加 pacman 配置文件
sudo echo '[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

# 安装导入 GPG key
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
