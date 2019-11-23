#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing WebStorm IDE

# configuration definition
DloadUrl=https://download-cf.jetbrains.com/webstorm/WebStorm-2019.1.2.tar.gz
DloadSaveName=
WebStormChildDir=/opt/WebStorm-191.7141.49

readonly DloadUrl
readonly WebStormChildDir

if [ ! -e ~/Downloads ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# Download WebStorm
DloadSaveName=$(downloadFile "${DloadUrl}")

# Decompression WebStorm
sudo tar -xzvf ${DloadSaveName} -C /opt/

# Out put exec shell path
echo "$WebStormChildDir/bin/webstorm.sh"

# running exec shell
"$WebStormChildDir/bin/webstorm.sh"

unset DloadSaveName

exit
