#!/data/data/com.termux/files/usr/bin/bash

# Colors
r="\033[1;31m"
g="\033[1;32m"
y="\033[1;33m"
b="\033[1;34m"
m="\033[1;35m"
c="\033[1;36m"
w="\033[1;37m"
reset="\033[0m"

clear
echo -e "${g}╔══════════════════════════════════════════════╗"
echo -e "${g}║        ${r}Emon-Termux Banner Maker Module${g}        ║"
echo -e "${g}╚══════════════════════════════════════════════╝${reset}"
sleep 1

# Ask for custom text
echo -ne "${c}👉 Enter your custom banner text (eg: EMON): ${w}"
read banner_text

# Ask for color
echo -e "${y}Select a color:"
echo -e "${g}1) Red\n2) Green\n3) Yellow\n4) Blue\n5) Magenta\n6) Cyan\n7) White"
read -p "🔢 Choice (1-7): " color_choice

case $color_choice in
    1) color=$r ;;
    2) color=$g ;;
    3) color=$y ;;
    4) color=$b ;;
    5) color=$m ;;
    6) color=$c ;;
    7) color=$w ;;
    *) color=$g ;;
esac

# Generate banner using figlet and toilet
pkg install figlet toilet -y > /dev/null 2>&1
clear
echo -e "${color}"
toilet -f future "$banner_text" --gay
echo -e "${reset}"

# Save to .bashrc
echo -e "\n${y}🔧 Do you want to set this banner to show every time you open Termux? (y/n): ${reset}"
read set_auto

if [[ $set_auto == "y" || $set_auto == "Y" ]]; then
    echo -e "\n# Emon Banner" >> $HOME/.bashrc
    echo "toilet -f future \"$banner_text\" --gay" >> $HOME/.bashrc
    echo -e "${g}✅ Banner has been added to ~/.bashrc${reset}"
else
    echo -e "${r}❌ Skipped auto banner setup.${reset}"
fi
