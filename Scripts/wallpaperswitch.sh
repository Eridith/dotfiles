#!/bin/bash

## Author : Josh Holsing
## Github : @Eridith
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2!     style-3     style-4     style-5
## style-6     style-7!     style-8     style-9     style-10

#type 6 style 7 or 2-8, 2-13,
source="$HOME/.config/rofi/launchers/type-3"
theme='style-1'

## Run
rofi_command="rofi \
    --prompt 'choose..'\
    -dmenu \
    -i \
    -theme ${source}/${theme}.rasi\
    --cache-file=/dev/null \
    --define=matching=fuzzy"

DIR=/home/Josh/Pictures/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

# TODO
#$DIR/

#menu(){
#counter=1
#
#for file in $(find "$DIR" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif -o -iname \*.bmp \) | sort); do)
#    printf "%d. %s\n" "$counter" "$file\n"
#    ((counter++))
#done
#}

menu(){
printf "0. Random\n"
printf "1. Abyss Watchers\n"
printf "2. Archway\n"
printf "3. Artorias\n"
printf "4. Berserk\n"
printf "5. Blossom Lake\n"
printf "6. Blue Nebula\n"
printf "7. Castle\n"
printf "8. Celestial\n"
printf "9. City Rain\n"
printf "10. Crimson Tree\n"
printf "11. CyanPunk\n"
printf "12. Cyberpunk City\n"
printf "13. Distant Etchings\n"
printf "14. Doomslayer\n"
printf "15. Eclipse\n"
printf "16. Erdtree\n"
printf "17. Ethereal\n"
printf "18. Fire Nebula\n"
printf "19. Foggy Days\n"
printf "20. Forest\n"
printf "21. Geralt\n"
printf "22. Gondor\n"
printf "23. Guts\n"
printf "24. Irithyll\n"
printf "25. Lake Night\n"
printf "26. Lighthouse\n"
printf "27. Moonlit\n"
printf "28. Mountain\n"
printf "29. Nekravol\n"
printf "30. Night City\n"
printf "31. River Sunset\n"
printf "32. Sauron\n"
printf "33. Scorched\n"
printf "34. Skyline\n"
printf "35. Sunset\n"
printf "36. Trails\n"
printf "37. UrbanBlur\n"
printf "38. Vaporwave City\n"
#printf "39. \n"
#printf "40. \n"
#printf "41. \n"
#printf "42. \n"
#printf "43. \n"
#printf "44. \n"
#printf "45. \n"
#printf "46. \n"
#printf "47. \n"
#printf "48. \n"
#printf "49. \n"
#printf "50. \n"
#printf "51. \n"
#printf "52. \n"
#printf "53. \n"
#printf "54. "
}

WALL0=/home/Josh/.cache/swww/cache
WALL1=$DIR/AbyssWatchers.jpg
WALL2=$DIR/Archway.jpeg
WALL3=$DIR/Artorias.png
WALL4=$DIR/Berserk.png
WALL5=$DIR/BlossomLake.png
WALL6=$DIR/BlueNebula.png
WALL7=$DIR/Castle.png
WALL8=$DIR/Celestial.png
WALL9=$DIR/CityRain.png
WALL10=$DIR/CrimsonTree.png
WALL11=$DIR/CyanPunk.png
WALL12=$DIR/CyberpunkCity.jpg
WALL13=$DIR/DistantEtchings.png
WALL14=$DIR/Doomslayer.jpg
WALL15=$DIR/Eclipse.jpeg
WALL16=$DIR/Erdtree.png
WALL17=$DIR/Ethereal.png
WALL18=$DIR/FireNebula.png
WALL19=$DIR/FoggyDays.jpg
WALL20=$DIR/Forest.png
WALL21=$DIR/Geralt.png
WALL22=$DIR/Gondor.jpg
WALL23=$DIR/Guts.png
WALL24=$DIR/Irithyll.jpg
WALL25=$DIR/LakeNight.png
WALL26=$DIR/Lighthouse.jpeg
WALL27=$DIR/Moonlit.png
WALL28=$DIR/Mountain.jpg
WALL29=$DIR/Nekravol.jpg
WALL30=$DIR/NightCity.png
WALL31=$DIR/RiverSunset.png
WALL32=$DIR/Sauron.png
WALL33=$DIR/Scorched.png
WALL34=$DIR/Skyline.png
WALL35=$DIR/Sunset.png
WALL36=$DIR/Trails.png
WALL37=$DIR/UrbanBlur.png
WALL38=$DIR/VaporwaveCity.png
#WALL39=$DIR/
#WALL40=$DIR/

#WALL41=$DIR/
#WALL42=$DIR/
#WALL43=$DIR/
#WALL44=$DIR/

#WALL45=$DIR/

#WALL46=$DIR/
#WALL47=$DIR/
#WALL48=$DIR/
#WALL49=$DIR/

#WALL50=$DIR/
#WALL51=$DIR/

#WALL52=$DIR/

#WALL53=$DIR/

#WALL54=$DIR/


file=$(</home/Josh/.cache/swww/*DP-1)
cache=$(readlink -f "/home/Josh/.cache/swww/cache")

swww query || swww init

main() {
choice=$(menu | ${rofi_command} | cut -d. -f1)
case $choice in
0)
    ln -sf ${DIR}/${RANDOMPICS} ${WALL0}
    return
    ;;
1)
    ln -sf $WALL1 $WALL0
    return
    ;;
2)
    ln -sf $WALL2 $WALL0
    return
    ;;
3)
    ln -sf $WALL3 $WALL0
    return
    ;;
4)
    ln -sf $WALL4 $WALL0
    return
    ;;
5)
    ln -sf $WALL5 $WALL0
    return
    ;;
6)
    ln -sf $WALL6 $WALL0
    return
    ;;
7)
    ln -sf $WALL7 $WALL0
    return
    ;;
8)
    ln -sf $WALL8 $WALL0
    return
    ;;
9)
    ln -sf $WALL9 $WALL0
    return
    ;;
10)
    ln -sf $WALL10 $WALL0
    return
    ;;
11)
    ln -sf $WALL11 $WALL0
    return
    ;;
12)
    ln -sf $WALL12 $WALL0
    return
    ;;
13)
    ln -sf $WALL13 $WALL0
    return
    ;;
14)
    ln -sf $WALL14 $WALL0
    return
    ;;
15)
    ln -sf $WALL15 $WALL0
    return
    ;;
16)
    ln -sf $WALL16 $WALL0
    return
    ;;
17)
    ln -sf $WALL17 $WALL0
    return
    ;;
18)
    ln -sf $WALL18 $WALL0
    return
    ;;
19)
    ln -sf $WALL19 $WALL0
    return
    ;;
20)
    ln -sf $WALL20 $WALL0
    return
    ;;
21)
    ln -sf $WALL21 $WALL0
    return
    ;;
22)
    ln -sf $WALL22 $WALL0
    return
    ;;
23)
    ln -sf $WALL23 $WALL0
    return
    ;;
24)
    ln -sf $WALL24 $WALL0
    return
    ;;
25)
    ln -sf $WALL25 $WALL0
    return
    ;;
26)
    ln -sf $WALL26 $WALL0
    return
    ;;
27)
    ln -sf $WALL27 $WALL0
    return
    ;;
28)
    ln -sf $WALL28 $WALL0
    return
    ;;
29)
    ln -sf $WALL29 $WALL0
    return
    ;;
30)
    ln -sf $WALL30 $WALL0
    return
    ;;
31)
    ln -sf $WALL31 $WALL0
    return
    ;;
32)
    ln -sf $WALL32 $WALL0
    return
    ;;
33)
    ln -sf $WALL33 $WALL0
    return
    ;;
34)
    ln -sf $WALL34 $WALL0
    return
    ;;
35)
    ln -sf $WALL35 $WALL0
    return
    ;;
36)
    ln -sf $WALL36 $WALL0
    return
    ;;
37)
    ln -sf $WALL37 $WALL0
    return
    ;;
38)
    ln -sf $WALL38 $WALL0
    return
    ;;
39)
    ln -sf $WALL39 $WALL0
    return
    ;;
40)
    ln -sf $WALL40 $WALL0
    return
    ;;
41)
    ln -sf $WALL41 $WALL0
    return
    ;;
42)
    ln -sf $WALL42 $WALL0
    return
    ;;
43)
    ln -sf $WALL43 $WALL0
    return
    ;;
44)
    ln -sf $WALL44 $WALL0
    return
    ;;
45)
    ln -sf $WALL45 $WALL0
    return
    ;;
46)
    ln -sf $WALL46 $WALL0
    return
    ;;
47)
    ln -sf $WALL47 $WALL0
    return
    ;;
48)
    ln -sf $WALL48 $WALL0
    return
    ;;
49)
    ln -sf $WALL49 $WALL0
    return
    ;;
50)
    ln -sf $WALL50 $WALL0
    return
    ;;
51)
    ln -sf $WALL51 $WALL0
    return
    ;;
52)
    ln -sf $WALL52 $WALL0
    return
    ;;
53)
    ln -sf $WALL53 $WALL0
    return
    ;;
54)
    ln -sf $WALL54 $WALL0
    return
    ;;
esac
}
killall -f || main

swwwVAR1="--transition-fps 165 --transition-type grow --transition-pos 200,1400 --transition-bezier 0.16,1,0.3,1.1"
swwwVAR2="--transition-fps 165 --transition-type fade --transition-bezier 0.16,1,0.3,1.1"

swww img ${WALL0} $swwwVAR1
sudo cp ${WALL0} /usr/share/nwg-hello/nwg.jpg

# Pywal Module
cache=$(readlink -f "/home/Josh/.cache/swww/cache")
wal -i ${cache} -n -t -e
