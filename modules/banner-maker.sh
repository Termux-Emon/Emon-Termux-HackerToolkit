#!/data/data/com.termux/files/usr/bin/bash

# Colors
c="\033[1;36m"
n="\033[0m"

clear
echo -e "${c}🎨 Banner Maker by Emon${n}"
read -p "🔤 Enter banner text: " banner
read -p "🎨 Font style (slant, big, pagga, mono12): " style

echo -e "${c}\n🎯 Preview:${n}"
toilet -f "$style" "$banner" | lolcat

# Save to .bashrc
read -p "💾 Set this as your Termux banner? (y/n): " confirm
if [ "$confirm" = "y" ]; then
    echo -e "\ntoilet -f '$style' '$banner' | lolcat" >> ~/.bashrc
    echo -e "${c}✔️ Saved. Restart Termux to see effect.${n}"
else
    echo -e "${n}❌ Not saved.${n}"
fi
