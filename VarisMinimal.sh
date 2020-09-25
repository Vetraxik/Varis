!#/bin/bash
clear
mkdir $HOME/.varis 
mkdir $HOME/.varis/wallpapers 
mkdir $HOME/.varis/deb
mkdir $HOME/.varis/proton
mkdir $HOME/.themes
mkdir $HOME/.icons
# JDK Section
sudo apt update && sudo apt upgrade
sudo apt install default-jdk
sudo apt install software-properties-common
sudo add-apt-repository ppa:linuxuprising/java
sudo apt -y install oracle-java13-installer
# VCS (Visual Code Studio)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt -y install apt-transport-https code
# Audio etc.
sudo add-apt-repository ppa:hsheth2/ppa
sudo apt-get update
sudo apt-get -y install cava spotify-client # Cava to equalizer w konsoli, fajnie wyglada
# Fajne Narzedzia ;-)
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install flameshot ukuu gnome-tweak-tool 
# Install all debs kurwo
sudo apt -f install $HOME/.varis/deb/*.deb
# rice rice baby
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme-circle numix-icon-theme
mv /data/Wallpapers $HOME/wallpapers
mv /data/themes $HOME/.themes
