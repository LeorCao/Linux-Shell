#!/bin/bash

# import

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

DloadUrl=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.27-linux-glibc2.12-x86_64.tar.gz
SavePath=/opt/MySQL-5.7.27

curl -L $DloadUrl | tar -xzf - -C $SavePath --strip-components=1

