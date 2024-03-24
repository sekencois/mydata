#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
Lred='\e[91m'
Lgreen='\e[92m'
g='\e[36m'
gb="\e[92;1m"
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
####
function line_atas(){
echo -e " ${CYAN}┌─────────────────────────────────────┐${p}"
}
function line_bawah() {
echo -e " ${CYAN}└─────────────────────────────────────┘${p}"
}
function line_tengah() {
echo -e "   ${CYAN}────────────────────────────────────────${p}"
}
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
clear
line_atas
purple " 
 Limit IP Login 
line_bawah
line_atas
echo -e " ${g}│  $tatus Autokill : $sts        "
echo -e " ${g}│  ${gb}[1]• ${b}  AutoKill After 5 Minutes"
echo -e " ${g}│  ${gb}[2]• ${b}  AutoKill After 10 Minutes"
echo -e " ${g}│  ${gb}[3]• ${b}  AutoKill After 15 Minutes"
echo -e " ${g}│  ${gb}[4]• ${b}  Turn Off AutoKill/MultiLogin"
line_bawah
line_atas
echo -e " ${g}│  ${gb}[x]• ${b} Go Back To Menu"
line_bawah
echo ""
echo -e ""
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
if [ -z $AutoKill ]; then
autokill-menu
fi

echo -e ""
case $AutoKill in
                1)
                echo -e ""
read -p "Limit IP User Login: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e ""
                echo -e "      Allowed IP Login   : $max IP"
                echo -e "      AutoKill Every     : 5 Minutes"      
                echo -e ""
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1                                                                  
                ;;
                2)
                echo -e ""
read -p "Limit IP User Login: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e ""
                echo -e "      Allowed IP Login   : $max IP"
                echo -e "      AutoKill Every     : 10 Minutes"
                echo -e ""
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                3)
                echo -e ""
read -p "Limit IP User Login: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e ""
                echo -e "      Allowed IP Login   : $max IP"
                echo -e "      AutoKill Every     : 15 Minutes"
                echo -e ""
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                4)
                clear
                rm /etc/cron.d/tendang
                echo -e ""
                echo -e ""
                echo -e "   AutoKill MultiLogin Turned Off  "
                echo -e ""
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                x)
                clear
                menu
                ;;
        esac
read -n 1 -s -r -p "Press any key to back"
autokill
fi

