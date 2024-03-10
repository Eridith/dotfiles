#!/bin/bash
url=https://github.com/hyprwm/Hyprland/releases/latest

# Version Check
Local=$(hyprctl version | grep Tag | sed 's/[^.0-9]*//g')
Git=$(wget -qO- $url | grep "<title>Release" | awk '{print $2}'| sed 's/[^.0-9]*//g')

if [ "$(printf '%s\n' "$Local" "$Git" | sort -V -r | tail -n1)" = "$Git" ]; then
    echo "Hyprland is up to date!"
    sleep 2
    exit 0
else
    echo "Update available!"
fi

#function confirm() {
#    while true; do
#        read -p "Would you like to update now or later? Session will be terminated. [Y/n] " yn
#        case $yn in
#            [Yy]* ) return 0;;
#            [Nn]* ) return 1;;
#            * ) return 0;;
#        esac
#    done
#}
#
#if confirm; then
#    echo "Exiting session... please wait."
#    hyprctl dispatch exit
#    sleep 20
#else
#    echo "Terminating update"
#    sleep 1
#    exit 0
#fi

# One day when Xorg dies, add this flag after -DNO_SYSTEMD:STRING=true
#-DNO_XWAYLAND:STRING=true

# Update Hyprland [ No Systemd ]
DIRECTORY=$HOME/Hyprland
cd
echo "Looking for existing Hyprland files"
if [ -d $DIRECTORY ]; then
    echo "Removing existing repository..."
    rm -rf Hyprland
    echo "Cloning Hyprland repositories..."
else
    echo "Cloning Hyprland repositories..."
fi
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
mkdir -p build && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_SYSTEMD:STRING=true -H./ -B./build -G Ninja
cmake --build ./build --config Release --target all -j $(nproc)
sudo cp ./build/Hyprland ./build/hyprctl/hyprctl ./build/hyprpm/hyprpm /usr/bin
find ./subprojects/wlroots/build/libwlroots.so.* -maxdepth 0 -type f | xargs sudo cp -t /usr/lib
rm -rf ../Hyprland
date > $HOME/.config/hypr/updated.txt
echo "Successfully updated Hyprland!"
sleep 1
echo "Now launching..."
sleep 1
#/usr/bin/Hyprland
exit 0