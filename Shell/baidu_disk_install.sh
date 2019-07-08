# !bin/bash

if [ ! -d "~/Downloads" ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# TODO 百度网盘暂不支持使用source下载安装，待以后推出后再修改
curl http://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/baidunetdisk_linux_2.0.1.deb -o baidunetdisk.deb

sudo dpkg -i baidunetdisk.deb