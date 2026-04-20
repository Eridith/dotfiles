#!/bin/bash

# WALLPAPERS PATH
wallDIR="$HOME/Pictures/Wallpapers"
cache=/home/Josh/.cache/wal/cache

# variables
source="$HOME/.config/rofi/launchers/type-2"
theme='style-13'
focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

# Monitor details
scale_factor=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .scale')
monitor_height=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .height')

icon_size=$(echo "scale=1; ($monitor_height * 3) / ($scale_factor * 150)" | bc)

# Apply limit
adjusted_icon_size=$(echo "$icon_size" | awk '{if ($1 < 15) $1 = 20; if ($1 > 25) $1 = 25; print $1}')

# Setting the rofi override with the adjusted icon size
rofi_override="element-icon{size:${adjusted_icon_size}%;}"


# awww transition config
FPS=165
TYPE="grow" # any, grow, fade, wipe, wave, center, random, none
DURATION=2
BEZIER="0.16,1,0.3,1.1"
POSITION="200,1400"
AWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER  --transition-pos $POSITION"

# Retrieve image files using null delimiter to handle spaces in filenames
mapfile -d '' PICS < <(find -L "${wallDIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.pnm" -o -iname "*.tga" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.farbfeld" -o -iname "*.png" -o -iname "*.gif" \) -print0)

RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME="Random"

# Rofi command
rofi_command="rofi -i -show -dmenu -config -theme ${source}/${theme}.rasi"

# Sorting Wallpapers
menu() {
  # Sort the PICS array
  IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))

  # Place "Random" at the beginning with the random picture as an icon
  printf "%s\x00icon\x1f%s\n" "$RANDOM_PIC_NAME" "$RANDOM_PIC"

  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")

    # Displaying .gif to indicate animated images
    if [[ ! "$pic_name" =~ \.gif$ ]]; then
      printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
    else
      printf "%s\n" "$pic_name"
    fi
  done
}

# initiate awww if not running
awww query || awww-daemon

# Choice of wallpapers
main() {
  choice=$(menu | $rofi_command)

  choice=$(echo "$choice" | xargs)
  RANDOM_PIC_NAME=$(echo "$RANDOM_PIC_NAME" | xargs)

  # No choice case
  if [[ -z "$choice" ]]; then
    echo "No choice selected. Exiting."
    exit 0
  fi

  # Random choice case
  if [[ "$choice" == "$RANDOM_PIC_NAME" ]]; then
	ln -sf $RANDOM_PIC $cache
	awww img "$cache" $AWWW_PARAMS;
	wal -i "$cache" -nte
    exit 0
  fi

  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    awww img "${PICS[$pic_index]}" $AWWW_PARAMS
    wal -i "${PICS[$pic_index]}" -nte
    ln -sf ${PICS[$pic_index]} $cache
  else
    echo "Image not found."
    exit 1
  fi

}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

main
