#!/data/data/com.termux/files/usr/bin/bash

# Colors
r="\033[1;31m"
g="\033[1;32m"
y="\033[1;33m"
c="\033[1;36m"
n="\033[0m"

# Start
clear
echo -e "${c}🔧 Initializing Emon-Termux-HackerToolkit setup...${n}"
sleep 1

# Play welcome sound (silent if fails)
termux-media-player play "sound.mp3" > /dev/null 2>&1 &

# Count-style install
pkgs=(
  git curl wget toilet figlet ruby
  neofetch ncurses-utils
  termux-api
  iproute2
)

echo -e "${y}📦 Installing necessary packages...${n}"
i=1
for pkg in "${pkgs[@]}"; do
    echo -ne "${g}[$i/${#pkgs[@]}] Installing ${pkg}...${n}\n"
    pkg install -y "$pkg" > /dev/null 2>&1
    ((i++))
    sleep 0.3
done

# Install lolcat (Ruby Gem)
gem install lolcat > /dev/null 2>&1

# Make executable
chmod +x tools.sh
chmod +x modules/*.sh

# Success banner
clear
echo -e "${g}"
figlet -f slant "Emon Toolkit" | lolcat
echo -e "${c}✅ Setup complete! Run with: ${y}bash tools.sh${n}"
