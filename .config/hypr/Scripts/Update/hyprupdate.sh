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

# Update hyprutils
cd
git clone https://github.com/hyprwm/hyprutils && cd hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprutils

# Update hyprlang
# Deps: hyprutils
cd
git clone https://github.com/hyprwm/hyprlang && cd hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprlang

# Update hyprwayland-scanner
cd
git clone https://github.com/hyprwm/hyprwayland-scanner && cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install ./build
rm -rf ../hyprwayland-scanner

# Update Aquamarine
# Deps: hyprwayland-scanner, hyprutils
cd
git clone https://github.com/hyprwm/aquamarine && cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../aquamarine

# Update hyprland-protocols
cd
git clone https://github.com/hyprwm/hyprland-protocols && cd hyprland-protocols
cmake -S . -B ./build
cmake --build ./build
sudo cmake --install ./build
rm -rf ../hyprland-protocols

# Update hyprgraphics
# Deps: hyprutils
cd
git clone https://github.com/hyprwm/hyprgraphics && cd hyprgraphics
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprgraphics

# Update hyprtoolkit (Req'd by hyprland apps)
cd
git clone https://github.com/hyprwm/hyprtoolkit && cd hyprtoolkit
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprtoolkit

# Update hyprland-guiutils
# Deps: hyprlang, hyprutils
cd
git clone https://github.com/hyprwm/hyprland-guiutils && cd hyprland-guiutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprland-guiutils

# Update hyprwire
# Deps: hyprutils
cd
git clone https://github.com/hyprwm/hyprwire && cd hyprwire
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprwire

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
# Toggle '-G Ninja' to the end of the command as necessary
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_SYSTEMD:STRING=true -B build -G Ninja
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../Hyprland
cd

# Create a flag for startup script to find and update hyprpm at first launch
touch $HOME/.config/hypr/updateflag.txt
# TODO set condition to execute when previous command exits 0

echo "Successfully updated Hyprland!"
sleep 1
exit 0
