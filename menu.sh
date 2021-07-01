#!/bin/bash

clear

figlet M AFDHAN  NezaVPN | lolcat

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "Scripy Install Hanya Bekerja Pada Operating System Debian, Ubuntu dan Centos"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
spinner=( 0oooo o0ooo oo0oo ooo0o oooo0 )
spin () {
  while [ 1 ]
  do 
    for i in "${spinner[@]}"
     do
       echo -ne "\r$i"
       sleep 0.2
    done
  done
 }
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%H:%M")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/stopwibu/domain)
else
domain=$IP
fi
	echo -e "${green}══════════════════════════════════════════════════════════${NC}"
	echo -e "                 M AFDHAN - NEZAVPN " | lolcat
	echo -e "${green}══════════════════════════════════════════════════════════${NC}"
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
        echo -e "${red}Waktu               :${NC} $jam"
        echo -e "${red}Hari                :${NC} $hari"
        echo -e "${red}Tanggal             :${NC} $tnggl"
        echo -e "${green}══════════════════════════════════════════════════════════${NC}"
	echo -e "${red}CPU Model           :${NC} $cname"
	echo -e "${red}Number Of Cores     :${NC}  $cores"
	echo -e "${red}CPU Frequency       :${NC} $freq MHz"
	echo -e "${red}Amount Of RAM       :${NC}  $tram MB"
	echo -e "${red}Amount Of Swap      :${NC}  $swap MB"
	echo -e "${red}System Uptime       :${NC} $up"
	echo -e "${red}ISP Name            :${NC}  $ISP"
	echo -e "${red}City                :${NC}  $CITY"
	echo -e "${red}IP VPS              :${NC}  $IPVPS"
	echo -e "${red}Domain              :${NC}  $domain"
	echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e "                    MENU TUNNELING " | lolcat

echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e " 1 ⸩  Panel SSH & OVPN         5 ⸩  Panel SSR & Shadowsocks"

echo -e " 2 ⸩  Panel Wireguard          6 ⸩  Panel Vmess/V2ray"

echo -e " 3 ⸩  Panel L2TP & PPTP        7 ⸩  Panel Vless"

echo -e " 4 ⸩  Panel SSTP               8 ⸩  Panel Trojan"

echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e " 0 ⸩ Masuk Ke Menu System      x ⸩  Keluar Dari Terminal"

echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e ""

read -p " [ # ] Masukkan Nomor Pilihanmu :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

wgg

;;

3)

ltp

;;

4)

ssstp

;;

5)

sssr

;;

6)

wss

;;

7)

vls

;;

8)

trj

;;

0)

menuu

;;

x)

exit

;;

*)

echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
clear
menu

;;

esac
