#!/bin/bash

clear
figlet -f slant AFDHAN - NEZA  VPN - PROJECT | lolcat

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
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d")
bln=$(date +"%B")
thn=$(date +"%Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
	echo -e "${red}══════════════════════════════════════════════════════════${NC}"
	echo -e "                 M AFDHAN - NEZAVPN " | lolcat
	echo -e "${red}══════════════════════════════════════════════════════════${NC}"
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
        echo -e "${green}Waktu                  :${NC} $jam WIB"
        echo -e "${green}Hari                   :${NC} $hari"
        echo -e "${green}Tanggal                :${NC} $tnggl $bln $thn"
        echo -e "${red}══════════════════════════════════════════════════════════${NC}"
	echo -e "${green}CPU Model              :${NC} $cname"
	echo -e "${green}Number Of Cores        :${NC}  $cores"
	echo -e "${green}CPU Frequency          :${NC} $freq MHz"
	echo -e "${green}Amount Of RAM          :${NC}  $tram MB"
	echo -e "${green}Amount Of Swap         :${NC}  $swap MB"
	echo -e "${green}System Uptime          :${NC} $up"
	echo -e "${green}ISP Name               :${NC}  $ISP"
	echo -e "${green}City                   :${NC}  $CITY"
	echo -e "${green}IP VPS                 :${NC}  $IPVPS"
	echo -e "${green}Domain                 :${NC}  $domain"
	echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                    MENU TUNNELING " | lolcat

echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e " 1 ⸩  Panel SSH & OVPN         5 ⸩  Panel SSR & Shadowsocks"

echo -e " 2 ⸩  Panel Wireguard          6 ⸩  Panel Vmess/V2ray"

echo -e " 3 ⸩  Panel L2TP & PPTP        7 ⸩  Panel Vless"

echo -e " 4 ⸩  Panel SSTP               8 ⸩  Panel Trojan"

echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                      MENU SYSTEM " | lolcat

echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "  9 ⸩  Masukkan Host          19 ⸩  Limit Bandwith"

echo -e " 10 ⸩  Masukkan Subdomain     20 ⸩  Ram VPS"

echo -e " 11 ⸩  Sertifikat V2RAY       21 ⸩  Ganti Password"

echo -e " 12 ⸩  Ubah Port VPN          22 ⸩  Reboot"

echo -e " 13 ⸩  Autobackup VPS         23 ⸩  Speedtest"

echo -e " 14 ⸩  Backup VPS             24 ⸩  Informasi System"

echo -e " 15 ⸩  Restore VPS            25 ⸩  Info Script"

echo -e " 16 ⸩  Menu Webmin            26 ⸩  Restart Service"

echo -e " 17 ⸩  Auto Reboot            27 ⸩  Multi Login SSH"

echo -e " 18 ⸩  Edit Banner SSH        28 ⸩  Restart Script"

echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "  x ⸩  Keluar Dari Terminal"

echo -e "${red}══════════════════════════════════════════════════════════${NC}"

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

9)

add-host

;;

10)

hostnya

;;

11)

certv2ray

;;

12)

change-port

;;

13)

autobackup

;;

14)

backup

;;

15)

restore

;;

16)

wbmn

;;

17)

auto-reboot

;;

18)

nano /etc/issue.net

;;

19)

limit-speed

;;

20)

ram

;;

21)

passwd

;;

22)

reboot

;;

23)

speedtest

;;

24)

info

;;

25)

about

;;

26)

restart

;;

27)

autokill

;;

28)

updatee

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
