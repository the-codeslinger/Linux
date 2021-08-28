sudo apt update
sudo apt upgrade -y

# Combat "manually installed drivers" in driver tool
sudo ubuntu-drivers autoinstall

# UI Tweaks
sudo apt install -y chrome-gnome-shell gnome-tweaks

# JSON parsing for Github downloads
sudo apt install -y curl jq vim

# Virtualization
sudo apt install -y virtualbox-qt virtualbox-guest-additions-iso

# (Hopefully) ONLY Ubuntu 21.04 or earlier
# OneDrive https://github.com/abraunegg/onedrive/blob/master/docs/ubuntu-package-install.md#distribution-ubuntu-2104
cp /etc/apt/sources.list ./sources.list.bak
cp /etc/apt/sources.list ./sources.list
echo "deb https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_21.04/ ./" >> sources.list
sudo cp sources.list /etc/apt/sources.list
rm ./sources.list

wget https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_21.04/Release.key
sudo apt-key add ./Release.key
rm ./Release.key

sudo apt update
sudo apt install -y onedrive

mkdir ~/.config/onedrive
cp ./onedrive_config ~/.config/onedrive/config

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code

# Development
sudo apt install -y build-essential git make automake cmake cmake-qt-gui ninja-build

# Other useful stuff
sudo apt install -y gimp

# Visuals
wget `curl -s https://api.github.com/repos/vinceliuice/WhiteSur-gtk-theme/releases/latest | jq --raw-output '.tarball_url'` -O whitesur.tar.gz
tar -xvf whitesur.tar.gz
cd vinceliuice-WhiteSur-gtk-theme-*

# Blue and Green theme, all colors (light/dark)
./install.sh -t blue -t green -i ubuntu

# GDM background, no blur
sudo ./tweaks.sh -g -n

cd ..
rm -rf vinceliuice-WhiteSur-gtk-theme-*
rm whitesur.tar.gz
