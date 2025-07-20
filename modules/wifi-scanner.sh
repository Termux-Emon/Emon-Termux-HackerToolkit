#!/data/data/com.termux/files/usr/bin/bash

# Colors
r="\033[1;31m"
g="\033[1;32m"
c="\033[1;36m"
n="\033[0m"

clear
echo -e "${c}📡 Scanning local network devices...${n}"

# Check ip command
if ! command -v ip > /dev/null; then
    echo -e "${r}[✘] ip command not found. Install: pkg install iproute2${n}"
    exit 1
fi

IP=$(ip route | grep wlan0 | awk '{print $9}' | cut -d'.' -f1-3)
if [ -z "$IP" ]; then
    echo -e "${r}[✘] WiFi not connected or wlan0 not found.${n}"
    exit 1
fi

echo -e "${g}[✓] Your network: ${IP}.0/24${n}"
sleep 1

echo -e "${c}🔍 Scanning...\n${n}"
for i in $(seq 1 254); do
    ping -c 1 -W 1 ${IP}.$i | grep "bytes from" &
done
wait

echo -e "\n${g}[✓] Scan complete!${n}"
