#!/data/data/com.termux/files/usr/bin/bash

# Colors
g="\033[1;32m"
c="\033[1;36m"
n="\033[0m"

clear
echo -e "${c}🔧 Auto-setting up Termux essentials...${n}"
sleep 1

echo -e "${g}→ Updating packages...${n}"
apt update -y && apt upgrade -y

echo -e "${g}→ Enabling storage access...${n}"
termux-setup-storage

echo -e "${g}→ Installing essentials...${n}"
pkg install -y git curl wget python neofetch figlet toilet

echo -e "${g}→ Installing extra tools...${n}"
pkg install -y nano vim openssh unzip tsu

clear
echo -e "${g}"
figlet -f small "Setup Done!" | lolcat
echo -e "${c}✅ Your Termux is ready, Emon!${n}"
