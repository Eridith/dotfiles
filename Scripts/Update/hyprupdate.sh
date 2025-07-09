#!/bin/bash
url=https://github.com/hyprwm/Hyprland/releases/latest

# Version Check
Local=$(hyprctl version | grep Tag | sed 's/[^.0-9]*//g') # We could reference ~/.local/share/hyprland/lastVersion
Git=$(wget -qO- $url | grep "<title>Release" | awk '{print $2}'| sed 's/[^.0-9]*//g')

if [ "$(printf '%s\n' "$Local" "$Git" | sort -V -r | tail -n1)" = "$Git" ]; then
    echo "Hyprland is up to date!"
    sleep 2
    exit 0
else
    echo "Update available!"
fi

# Update Aquamarine
cd
git clone https://github.com/hyprwm/aquamarine
cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
rm -rf ../aquamarine

# Update hyprscanner
cd
git clone https://github.com/hyprwm/hyprwayland-scanner
cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install ./build
rm -rf ../hyprwayland-scanner

# Update hyprutils
cd
git clone https://github.com/hyprwm/hyprutils
cd hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprutils

# Update hyprgraphics
cd
git clone https://github.com/hyprwm/hyprgraphics
cd hyprgraphics
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprgraphics

# Update QT-utils
cd
git clone https://github.com/hyprwm/hyprland-qtutils
cd hyprland-qtutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprland-qtutils

# Update Hyprland [ No Systemd ]
DIRECTORY=$HOME/Hyprland
cd
echo "Looking for existing Hyprland files"
if [ -d $DIRECTORY ]; then
    echo "Removing existing repository..."
    rm -rf Hyprland
fi
echo "Cloning Hyprland repositories..."
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
mkdir -p build && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_SYSTEMD:STRING=true -B build -G Ninja
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
#cmake --build ./build --config Release --target all #-j $(nproc)
sudo cmake --install ./build
#sudo cp ./build/Hyprland ./build/hyprctl/hyprctl ./build/hyprpm/hyprpm /usr/bin
#Deprecated since v0.42.0
#find ./subprojects/wlroots/build/libwlroots.so.* -maxdepth 0 -type f | xargs sudo cp -t /usr/lib
rm -rf ../Hyprland

# Create a flag for startup script to find and update hyprpm at first launch
touch $HOME/.config/hypr/updateflag.txt

echo "Successfully updated Hyprland!"
sleep 1
#if [ $EUID -eq 0 ];then
#    echo "Root detected! Exiting..."
#    exit
#else
#    echo "Now launching..."
#    sleep 1
#    dbus-run-session /home/$USER/.local/bin/wrapped_hl.sh
#fi
exit 0
