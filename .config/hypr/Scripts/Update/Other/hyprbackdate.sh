#!/bin/bash
url=https://github.com/hyprwm/Hyprland/releases/latest

# Version Check
Local=$(hyprctl version | grep Tag | sed 's/[^.0-9]*//g')
Git=$(wget -qO- $url | grep "<title>Release" | awk '{print $2}'| sed 's/[^.0-9]*//g')

#if [ "$(printf '%s\n' "$Local" "$Git" | sort -V -r | tail -n1)" = "$Git" ]; then
#    echo "Hyprland is up to date!"
#    sleep 2
#    exit 0
#else
#    echo "Update available!"
#fi

# Update Aquamarine
#cd
#git clone https://github.com/hyprwm/aquamarine/releases/tag/v0.4.3
#cd aquamarine
#cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
#cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
#sudo cmake --install build
#rm -rf ../aquamarine

# Update hyprscanner
#cd
#git clone https://github.com/hyprwm/hyprwayland-scanner
#cd hyprwayland-scanner
#cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
#cmake --build build -j `nproc`
#sudo cmake --install ./build
#rm -rf ../hyprwayland-scanner

# Update hyprutils
#cd
#git clone https://github.com/hyprwm/hyprutils
#cd hyprutils
#cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
#cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
#sudo cmake --install ./build
#rm -rf ../hyprutils

# Update hyprgraphics
#cd
#git clone https://github.com/hyprwm/hyprgraphics
#cd hyprgraphics
#cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
#cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
#sudo cmake --install ./build
#rm -rf ../hyprgraphics

# Update Hyprland [ No Systemd ]
DIRECTORY=$HOME/hyprland-source
cd
echo "Looking for existing Hyprland files"

if [ -d $DIRECTORY ]; then
    echo "Removing existing repository..."
    rm -rf Hyprland
fi

echo "Cloning Hyprland repositories..."
wget https://github.com/hyprwm/Hyprland/releases/download/v0.52.1/source-v0.52.1.tar.gz
tar -xvf source-v0.52.1.tar.gz && rm source-v0.52.1.tar.gz
cd hyprland-source
mkdir -p build && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_SYSTEMD:STRING=true -B build -G Ninja
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build

if [ $? -eq 0 ]; then
    touch $HOME/.config/hypr/updateflag.txt
    echo "Successfully updated Hyprland!"
else
    echo "Failed to update Hyprland!"
fi

rm -rf ../hyprland-source

sleep 1
exit 0
