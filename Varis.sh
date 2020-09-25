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
# Steam
wget -P $HOME/.varis/proton https://github.com/GloriousEggroll/proton-ge-custom/releases/download/5.9-GE-6-ST/Proton-5.9-GE-6-ST.tar.gz
mkdir ~/.steam/root/compatibilitytools.d
tar xvzf $HOME/.varis/proton/Proton-5.9-GE-6-ST.tar.gz -C ~/.steam/root/compatibilitytools.d/
sudo apt -y install steam 
# Audio etc.
sudo add-apt-repository ppa:hsheth2/ppa
sudo apt-get update
sudo apt-get -y install cava spotify-client # Cava to equalizer w konsoli, fajnie wyglada
# Wine
sudo apt install -y wine wine-staging
wget -P $HOME/.varis/deb https://m-reimer.de/wine-lol/debian/wine-lol-glibc_2.32-2_i386.deb
wget -P $HOME/.varis/deb https://m-reimer.de/wine-lol/debian/wine-lol_5.6-1_i386.deb
# Fajne Narzedzia ;-)
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install flameshot ukuu gnome-tweak-tool 
# Discord
wget -P $HOME/.varis/deb https://discord.com/api/download?platform=linux&format=deb
# Minecraft
wget -P $HOME/.varis/minecraft https://optifine.net/downloadx?f=OptiFine_1.16.2_HD_U_G3.jar&x=047fec15227a8c7eeef5e03c32fe2352
wget -P $HOME/.varis/deb https://launcher.mojang.com/download/Minecraft.deb
sudo apt -f install $HOME/.varis/deb/Minecraft.deb
mkdir $HOME/.minecraft/versions
mv $HOME/.varis/minecraft/Optifine_1.16.2_HD_U_G3.jar $HOME/.minecraft/versions/OptiFine_1.16.2_HD_U_G3
# Install all debs kurwo
sudo apt -f install $HOME/.varis/deb/*.deb
# rice rice baby
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme-circle numix-icon-theme
mv /data/Wallpapers $HOME/wallpapers
mv /data/themes $HOME/.themes
# MangoHud
git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
cd MangoHud
./build.sh build
./build.sh package
./build.sh install
cd ..
rm -r MangoHud
mv /data/MangoHud.conf $HOME/.config/MangoHud/MangoHud.conf