# !bin/bash

# import
source ./common/file.sh

desktopDir=/usr/share/application/
readonly desktopDir

mkdir ~/Downloads

cd ~/Downloads

curl -L https://update.code.visualstudio.com/latest/linux-x64/stable -o vs-code.tar.gz

if [ ! -e /opt/ ]; then
    sudo mkdir /opt/
fi

sudo tar -xzvf vs-code.tar.gz -C /opt/

vscodeDir=$(getChildDir "test")

cd /opt/${vscodeDir}

sudo chmod 755 code

sudo touch vscode.desktop

sudo chmod 777 vscode.desktop

deskTop='[Desktop Entry]
Name=VSCode
Type=Application
Exec=/opt/VSCode-linux-x64/bin/code
Icon=/opt/VSCode-linux-x64/resources/app/resources/linux/code.png
Categories=Development'

sudo echo ${deskTop} > vscode.desktop

if [ condition ]; then
    sudo rm -f
fi

mv vscode.desktop ${desktopDir}

chmod 755 ${desktopDir}vscode.desktop

exit
