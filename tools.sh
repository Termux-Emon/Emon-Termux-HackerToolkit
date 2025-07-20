#!/data/data/com.termux/files/usr/bin/bash

# Colors
r="\033[1;31m"
g="\033[1;32m"
c="\033[1;36m"
n="\033[0m"

# Banner
clear
echo -e "${r}"
toilet -f pagga "EM0N" | lolcat
echo -e "${g}Welcome to the Emon-Termux-HackerToolkit${n}"
neofetch
echo -e "${c}Choose your weapon:\n${n}"

# Menu
echo -e "${g}[1] Auto Setup Termux"
echo -e "[2] WiFi Scanner"
echo -e "[3] SMS Bomber (Demo)"
echo -e "[4] Banner Generator"
echo -e "[0] Exit${n}"
read -p ">> " choice

case $choice in
  1) bash modules/auto-setup.sh ;;
  2) bash modules/wifi-scanner.sh ;;
  3) bash modules/sms-bomber.sh ;;
  4) bash modules/banner-maker.sh ;;
  0) echo -e "${r}Goodbye, hacker!${n}"; exit ;;
  *) echo -e "${r}Invalid option.${n}" ;;
esac
