#!/data/data/com.termux/files/usr/bin/bash

# Colors
r="\033[1;31m"
g="\033[1;32m"
c="\033[1;36m"
n="\033[0m"

clear
echo -e "${r}"
figlet "SMS BOMBER" | lolcat
echo -e "${g}Demo Version by Emon - No real SMS will be sent.${n}"

read -p "📱 Enter target phone number: " number
read -p "💣 Number of messages to send (demo): " count

echo -e "${c}🔥 Starting fake bombing on $number ...${n}"
for i in $(seq 1 $count); do
    echo -e "${r}[!] Sending fake SMS $i to $number${n}"
    sleep 0.3
done

echo -e "${g}✔️ Done (demo mode).${n}"
