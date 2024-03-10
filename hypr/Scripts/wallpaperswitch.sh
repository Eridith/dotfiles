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

source="$HOME/.config/rofi/launchers/type-6"
theme='style-7'

## Run
rofi_command="rofi \
    --prompt 'choose..'\
    -dmenu \
    -theme ${source}/${theme}.rasi\
    --cache-file=/dev/null \
    --define=matching=fuzzy"

DIR=/home/Josh/Pictures/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]} 

# To be added
# Angel.jpg
# Malthael.jpg
# Tyrael.jpg

menu(){
printf "0. Random\n"
printf "1. Ascent\n"
printf "2. Bebop\n"
printf "3. Berserk\n"
printf "4. Bloodborne\n"
printf "5. Blossom Lake\n"
printf "6. Blue Nebula\n"
printf "7. Cherry Valley\n"
printf "8. City\n"
printf "9. Crest\n"
printf "10. Crimson\n"
printf "11. CyanPunk\n"
printf "12. Desert\n"
printf "13. Distant Etchings\n"
printf "14. Docking Bay\n"
printf "15. Doom Eternal\n"
printf "16. Doomslayer\n"
printf "17. Dunwall Fortress\n"
printf "18. Dusk Metropolis\n"
printf "19. Earth\n"
printf "20. Elden Ring\n"
printf "21. Elite Dangerous\n"
printf "22. Erdtree\n"
printf "23. Firewatch Forest\n"
printf "24. Flourescent Room\n"
printf "25. Foggy Days\n"
printf "26. Forest\n"
printf "27. Fountain Of The Dead\n"
printf "28. Futuristic\n"
printf "29. Geralt\n"
printf "30. Glacial Valley\n"
printf "31. Guts\n"
printf "32. Guts Cropped\n"
printf "33. Halfway\n"
printf "34. Irithyll\n"
printf "35. Irithyll Bridge\n"
printf "36. Jakku\n"
printf "37. Kindled\n"
printf "38. Lake\n"
printf "39. Monolith\n"
printf "40. Nekravol\n"
printf "41. NightCity\n"
printf "42. No Man's Land\n"
printf "43. Path\n"
printf "44. Pillars Of Terra\n"
printf "45. Road Of Sacrifice\n"
printf "46. Scorched\n"
printf "47. Skyline\n"
printf "48. Space Elevator\n"
printf "49. Sunset\n"
printf "50. The White Wolf\n"
printf "51. Trails\n"
printf "52. Trenches\n"
printf "53. Vaporwave City\n"
printf "54. Winding Valley"
}

WALL0=/home/Josh/.cache/swww/cache.png
WALL1=$DIR/Ascent.jpg
WALL2=$DIR/Bebop.png
WALL3=$DIR/Berserk.png
WALL4=$DIR/Bloodbourne.jpg
WALL5=$DIR/BlossomLake.png
WALL6=$DIR/BlueNebula.png
WALL7=$DIR/CherryValley.png
WALL8=$DIR/City.jpg
WALL9=$DIR/Crest.png
WALL10=$DIR/Crimson.png
WALL11=$DIR/CyanPunk.png
WALL12=$DIR/Desert.png
WALL13=$DIR/DistantEtchings.png
WALL14=$DIR/DockingBay.jpg
WALL15=$DIR/DoomEternal.jpg
WALL16=$DIR/Doomslayer.jpg
WALL17=$DIR/DunwallFortress.jpg
WALL18=$DIR/DuskMetropolis.png
WALL19=$DIR/Earth.jpg
WALL20=$DIR/EldenRing.png
WALL21=$DIR/EliteDangerous.jpg
WALL22=$DIR/Erdtree.png
WALL23=$DIR/FirewatchForest.jpg
WALL24=$DIR/FlourescentRoom.png
WALL25=$DIR/FoggyDays.jpg
WALL26=$DIR/Forest.png
WALL27=$DIR/FountainOfTheDead.jpg
WALL28=$DIR/Futuristic.jpg
WALL29=$DIR/Geralt.png
WALL30=$DIR/GlacialValley.jpg
WALL31=$DIR/Guts.png
WALL32=$DIR/GutsCropped.png
WALL33=$DIR/HalfwayFortress.jpg
WALL34=$DIR/Irithyll.jpg
WALL35=$DIR/IrithyllBridge.jpg
WALL36=$DIR/Jakku.jpg
WALL37=$DIR/Kindled.jpg
WALL38=$DIR/Lake.jpg
WALL39=$DIR/Monolith.png
WALL40=$DIR/Nekravol.jpg
WALL41=$DIR/NightCity.png
WALL42=$DIR/NoMan\'sLand.jpg
WALL43=$DIR/PathToAbyss.jpg
WALL44=$DIR/PillarsOfTerra.png
WALL45=$DIR/RoadOfSacrifice.jpg
WALL46=$DIR/Scorched.png
WALL47=$DIR/Skyline.png
WALL48=$DIR/SpaceElevator.jpg
WALL49=$DIR/Sunset.png
WALL50=$DIR/TheWhiteWolf.jpg
WALL51=$DIR/Trails.png
WALL52=$DIR/Trenches.jpg
WALL53=$DIR/VaporwaveCity.png
WALL54=$DIR/WindingValley.png

swwwVAR="--transition-fps 144 --transition-type grow --transition-pos 200,1400 --transition-bezier 0.16,1,0.3,1.1"
CACHE=/home/Josh/.cache/swww/cache.png

swww query || swww init

main() {
choice=$(menu | ${rofi_command} | cut -d. -f1)
case $choice in
0)
    swww img ${DIR}/${RANDOMPICS} $swwwVAR & cp ${DIR}/${RANDOMPICS} ${CACHE} & sleep 2 && wal -i ${WALL0} -n
    return # TODO Fix Copied file extension matching
    ;;
1)
    swww img $WALL1 $swwwVAR & cp $WALL1 $CACHE && wal -i $WALL1 -n
    return
    ;;
2)
    swww img $WALL2 $swwwVAR & cp $WALL2 $CACHE && wal -i $WALL2 -n
    return
    ;;
3)
    swww img $WALL3 $swwwVAR & cp $WALL3 $CACHE && wal -i $WALL3 -n
    return
    ;;
4)
    swww img $WALL4 $swwwVAR & cp $WALL4 $CACHE && wal -i $WALL4 -n
    return
    ;;
5)
    swww img $WALL5 $swwwVAR & cp $WALL5 $CACHE && wal -i $WALL5 -n
    return
    ;;
6)
    swww img $WALL6 $swwwVAR & cp $WALL6 $CACHE && wal -i $WALL6 -n
    return
    ;;
7)
    swww img $WALL7 $swwwVAR & cp $WALL7 $CACHE && wal -i $WALL7 -n
    return
    ;;
8)
    swww img $WALL8 $swwwVAR & cp $WALL8 $CACHE && wal -i $WALL8 -n
    return
    ;;
9)
    swww img $WALL9 $swwwVAR & cp $WALL9 $CACHE && wal -i $WALL9 -n
    return
    ;;
10)
    swww img $WALL10 $swwwVAR & cp $WALL10 $CACHE && wal -i $WALL10 -n
    return
    ;;
11)
    swww img $WALL11 $swwwVAR & cp $WALL11 $CACHE && wal -i $WALL11 -n
    return
    ;;
12)
    swww img $WALL12 $swwwVAR & cp $WALL12 $CACHE && wal -i $WALL12 -n
    return
    ;;
13)
    swww img $WALL13 $swwwVAR & cp $WALL13 $CACHE && wal -i $WALL13 -n
    return
    ;;
14)
    swww img $WALL14 $swwwVAR & cp $WALL14 $CACHE && wal -i $WALL14 -n
    return
    ;;
15)
    swww img $WALL15 $swwwVAR & cp $WALL15 $CACHE && wal -i $WALL15 -n
    return
    ;;
16)
    swww img $WALL16 $swwwVAR & cp $WALL16 $CACHE && wal -i $WALL16 -n
    return
    ;;
17)
    swww img $WALL17 $swwwVAR & cp $WALL17 $CACHE && wal -i $WALL17 -n
    return
    ;;
18)
    swww img $WALL18 $swwwVAR & cp $WALL18 $CACHE && wal -i $WALL18 -n
    return
    ;;
19)
    swww img $WALL19 $swwwVAR & cp $WALL19 $CACHE && wal -i $WALL19 -n
    return
    ;;
20)
    swww img $WALL20 $swwwVAR & cp $WALL20 $CACHE && wal -i $WALL20 -n
    return
    ;;
21)
    swww img $WALL21 $swwwVAR & cp $WALL21 $CACHE && wal -i $WALL21 -n
    return
    ;;
22)
    swww img $WALL22 $swwwVAR & cp $WALL22 $CACHE && wal -i $WALL22 -n
    return
    ;;
23)
    swww img $WALL23 $swwwVAR & cp $WALL23 $CACHE && wal -i $WALL23 -n
    return
    ;;
24)
    swww img $WALL24 $swwwVAR & cp $WALL24 $CACHE && wal -i $WALL24 -n
    return
    ;;
25)
    swww img $WALL25 $swwwVAR & cp $WALL25 $CACHE && wal -i $WALL25 -n
    return
    ;;
26)
    swww img $WALL26 $swwwVAR & cp $WALL26 $CACHE && wal -i $WALL26 -n
    return
    ;;
27)
    swww img $WALL27 $swwwVAR & cp $WALL27 $CACHE && wal -i $WALL27 -n
    return
    ;;
28)
    swww img $WALL28 $swwwVAR & cp $WALL28 $CACHE && wal -i $WALL28 -n
    return
    ;;
29)
    swww img $WALL29 $swwwVAR & cp $WALL29 $CACHE && wal -i $WALL29 -n
    return
    ;;
30)
    swww img $WALL30 $swwwVAR & cp $WALL30 $CACHE && wal -i $WALL30 -n
    return
    ;;
31)
    swww img $WALL31 $swwwVAR & cp $WALL31 $CACHE && wal -i $WALL31 -n
    return
    ;;
32)
    swww img $WALL32 $swwwVAR & cp $WALL32 $CACHE && wal -i $WALL32 -n
    return
    ;;
33)
    swww img $WALL33 $swwwVAR & cp $WALL33 $CACHE && wal -i $WALL33 -n
    return
    ;;
34)
    swww img $WALL34 $swwwVAR & cp $WALL34 $CACHE && wal -i $WALL34 -n
    return
    ;;
35)
    swww img $WALL35 $swwwVAR & cp $WALL35 $CACHE && wal -i $WALL35 -n
    return
    ;;
36)
    swww img $WALL36 $swwwVAR & cp $WALL36 $CACHE && wal -i $WALL36 -n
    return
    ;;
37)
    swww img $WALL37 $swwwVAR & cp $WALL37 $CACHE && wal -i $WALL37 -n
    return
    ;;
38)
    swww img $WALL38 $swwwVAR & cp $WALL38 $CACHE && wal -i $WALL38 -n
    return
    ;;
39)
    swww img $WALL39 $swwwVAR & cp $WALL39 $CACHE && wal -i $WALL39 -n
    return
    ;;
40)
    swww img $WALL40 $swwwVAR & cp $WALL40 $CACHE && wal -i $WALL40 -n
    return
    ;;
41)
    swww img $WALL41 $swwwVAR & cp $WALL41 $CACHE && wal -i $WALL41 -n
    return
    ;;
42)
    swww img $WALL42 $swwwVAR & cp $WALL42 $CACHE && wal -i $WALL42 -n
    return
    ;;
43)
    swww img $WALL43 $swwwVAR & cp $WALL43 $CACHE && wal -i $WALL43 -n
    return
    ;;
44)
    swww img $WALL44 $swwwVAR & cp $WALL44 $CACHE && wal -i $WALL44 -n
    return
    ;;
45)
    swww img $WALL45 $swwwVAR & cp $WALL45 $CACHE && wal -i $WALL45 -n
    return
    ;;
46)
    swww img $WALL46 $swwwVAR & cp $WALL46 $CACHE && wal -i $WALL46 -n
    return
    ;;
47)
    swww img $WALL47 $swwwVAR & cp $WALL47 $CACHE && wal -i $WALL47 -n
    return
    ;;
48)
    swww img $WALL48 $swwwVAR & cp $WALL48 $CACHE && wal -i $WALL48 -n
    return
    ;;
49)
    swww img $WALL49 $swwwVAR & cp $WALL49 $CACHE && wal -i $WALL49 -n
    return
    ;;
50)
    swww img $WALL50 $swwwVAR & cp $WALL50 $CACHE && wal -i $WALL50 -n
    return
    ;;
51)
    swww img $WALL51 $swwwVAR & cp $WALL51 $CACHE && wal -i $WALL51 -n
    return
    ;;
52)
    swww img $WALL52 $swwwVAR & cp $WALL52 $CACHE && wal -i $WALL52 -n
    return
    ;;
53)
    swww img $WALL53 $swwwVAR & cp $WALL53 $CACHE && wal -i $WALL53 -n
    return
    ;;
54)
    swww img $WALL54 $swwwVAR & cp $WALL54 $CACHE && wal -i $WALL54 -n
    return
    ;;
esac
}

killall -f || main