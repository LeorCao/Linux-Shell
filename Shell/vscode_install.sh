# !bin/bash

# import
source ./common/file.sh

desktopDir=/usr/share/applications/
vsName=vs-code.tar.gz

mkdir ~/Downloads

cd ~/Downloads

curl -L https://update.code.visualstudio.com/latest/linux-x64/stable -o ${vsName}

if [ ! -e /opt/ ]; then
    sudo mkdir /opt/
fi

sudo tar -xzvf ${vsName} -C /opt/

sudo rm -rf ${vsName}

cd /opt/

vscodeDir=$(getChildDir "VSCode")
echo $vscodeDir

cd "${vscodeDir}/bin"

sudo chmod 755 code

sudo touch vscode.desktop

sudo chmod 777 vscode.desktop

sudo echo '[Desktop Entry]
Name=VSCode
Type=Application
Exec=/opt/VSCode-linux-x64/bin/code
Icon=/opt/VSCode-linux-x64/resources/app/resources/linux/code.png
Categories=Development' >vscode.desktop

sudo mv vscode.desktop ${desktopDir}

sudo chmod 755 ${desktopDir}vscode.desktop

exit
