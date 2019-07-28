# !bin/bash

# Author      : Leor Cao
# Create date : 2019-07-29 01:57
# Remarks     : Manjaro 安装常用软件，必须先配置切换国内镜像源 choice_china_source.sh

# yay 替换 pacman
sudo pacman -S yay

# VIM
yay -S vim

# 搜狗拼音
yay -S fcitx-im
yay -S fcitx-configtool
yay -S fcitx-sogoupinyin
# 配置 fcitx
echo 'export LC_CTYPE=zh_CN.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"' >> ~/.xprofile

# chrome
yay -S google-chrome

# chromium
# yay -S chromium

# wps
yay -S wps-office
yay -S ttf-wps-fonts

# 网易云音乐
yay -S netease-cloud-music

# Git
yay -S git

# GitKraken git 客户端
yay -S GitKraken

# Foxit PDF
yay -S foxit

# 深度截图
yay -S deepin-screenshot

# ag 代码搜索
yay -S the_silver_searcher

# filezilla FTP
yay -S filezilla

# notepadqq
yay -S 

# teamviewer
yay -S teamviewer

# latte dock
yay -S latte-dock

# 安装 VirtualBox
yay -S virtualbox
yay -S virtualbox-ext-oracle
sudo modprobe vboxdrv