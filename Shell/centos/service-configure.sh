#!/bin/bash

. ./common/common.sh

NEW_SSH_PORT=""
NEW_USER_NAME=""

while getopts :u:p:help opt
do  
    case $opt in
        u)
            NEW_USER_NAME=$OPTARG
        ;;
        p)  
            NEW_SSH_PORT=$OPTARG
        ;;
        help)
            echo "-u : New user name"
            echo "-p : Remote login service new port"
        ;;
        *)  
            echo "-$opt not recognized"
        ;;
    esac
done

# 配置服务器，禁止root ssh登录，修改禁用22端口ssh登录。创建一个用于远程登录的新用户并配置密码

infoLog "Updating system..."

# 更新系统
yum update

infoLog "Installing common program..."

# 安装常用软件
yum install vim -y

infoLog "Installing fail2ban and configure..."

# 安装、配置 fail2ban
yum install epel-release

yum install fail2ban

# 创建本地配置文件
forceCreateAndWriteContToFile "/etc/fail2ban/jail.local" "[ssh-iptables]\n# 是否启用 fail2ban\nenabled  = true\n# sshd 默认参考/etc/fail2ban/filter.d/sshd.conf\nfilter   = sshd\n# 符合 /etc/fail2ban/action.d/iptables.conf 中的ip将会被拒绝访问\naction   = iptables[name=SSH, port=${NEW_SSH_PORT}, protocol=tcp]\n# sendmail-whois[name=SSH, dest=root, sender=fail2ban@example.com]\n# fail2ban 日志文件存储路径\nlogpath  = /var/log/secure\n# 最大重试次数\nmaxretry = 6\n# 最大尝试次数的时间区间\nfindtime  = 600\n# ip 拒绝访问次数\nbantime  = 600"

# 启动fail2ban
sudo chkconfig --level 23 fail2ban on

sudo systemctl start fail2ban

sudo systemctl enable fail2ban

infoLog "Iptables : "

# 查看 iptables 是否添加了 fail2ban 的规则
iptables -L

infoLog "Install fail2ban success~"

infoLog "Start configure ssh disable 22 prot"

infoLog "Edit sshd_config file Port feild..."

# 修改 ssh 配置文件
editReplaceFileByLine "/etc/ssh/sshd_config" "^Port$" "Port ${NEW_SSH_PORT}"

infoLog "Add new ssh port to firewall"

# 在防火墙中添加并启用新的 ssh 端口
firewall-cmd --zone=public --add-port=${NEW_SSH_PORT}/tcp --permanent

infoLog "restart firewall"

# 重启防火墙
firewall-cmd --reload

infoLog "View the status of the new port in firewall"

# 查看新的端口号状态
firewall-cmd --zone=public --query-port=${NEW_SSH_PORT}/tcp

# 添加新用户并停用root直接登录服务器
infoLog "创建新用户"
adduser ${NEW_USER_NAME}

infoLog "设置密码"
passwd ${NEW_USER_NAME}

infoLog "配置 sudo 权限"
editWriteFile "/etc/sudoers" "${NEW_USER_NAME}    ALL=(ALL)    ALL"
sudo systemctl restart sshd

# 停用 root 用户远程登录
infoLog "停用远程使用 root 用户登录"
editReplaceFileByLine "/etc/ssh/sshd_config" "^PermitRootLogin yes$" "PermitRootLogin no"