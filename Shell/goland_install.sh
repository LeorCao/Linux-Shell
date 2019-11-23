#!/bin/bash

# import
source ./common/common.sh

# Author      : Leor Cao
# Create date : 2019-07-06 15:23
# Remarks     : Installing Goland IDE

# configuration definition
DloadGloandUrl=https://download.jetbrains.8686c.com/go/goland-2019.1.2.tar.gz
DloadSaveName=${DloadGloandUrl##*/}
GolandChildDir=/opt/GoLand-2019.1.2

if [ ! -e ~/Downloads ]; then
    mkdir ~/Downloads
fi

cd ~/Downloads

# Download Goland
DloadSaveName=$(downloadFile "${DloadGloandUrl}")

# Decompression Goland
sudo tar -xzvf ${DloadSaveName} -C /opt/

# Creation desktop
creationDesktop "goland" "Goland IDEA" "${GolandChildDir}/bin/goland.sh" "${GolandChildDir}/bin/goland.png"

# Running exec shell
$GolandChildDir/bin/goland.sh

exit
