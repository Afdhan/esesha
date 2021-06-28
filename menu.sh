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
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
	echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"
	echo -e "                 M AFDHAN - NEZAVPN " | lolcat
	echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
                                    date | lolcat
        echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"
	echo -e "\e[032;1mCPU Model           :\e[0m$cname"
	echo -e "\e[032;1mNumber Of Cores     :\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency       :\e[0m$freq MHz"
	echo -e "\e[032;1mAmount Of RAM       :\e[0m $tram MB"
	echo -e "\e[032;1mAmount Of Swap      :\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime       :\e[0m$up"
	echo -e "\e[032;1mISP Name            :\e[0m $ISP"
	echo -e "\e[032;1mCity                :\e[0m $CITY"
	echo -e "\e[032;1mTimeZone            :\e[0m $WKT"
	echo -e "\e[033;1mIP VPS              :\e[0m $IPVPS"
	echo -e "\e[033;1mDomain              :\e[0m $domain"
	echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"

echo -e "\e[32m═══════════════════════════════════════════════════════════\e[m"

echo -e "                    MENU TUNNELING " | lolcat

echo -e "\e[32m═══════════════════════════════════════════════════════════\e[m"

echo -e " 1 ⸩  Panel SSH & OVPN         5 ⸩  Panel SSR & Shadowsocks"

echo -e " 2 ⸩  Panel Wireguard          6 ⸩  Panel Vmess/V2ray"

echo -e " 3 ⸩  Panel L2TP & PPTP        7 ⸩  Panel Vless"

echo -e " 4 ⸩  Panel SSTP               8 ⸩  Panel Trojan"

echo -e "\e[32m═══════════════════════════════════════════════════════════\e[m"

echo -e "                      MENU SYSTEM " | lolcat

echo -e "\e[32m═══════════════════════════════════════════════════════════\e[m"

echo -e "  9 ⸩  Masukkan Domain/Host Pribadi"

echo -e " 10 ⸩  Masukkan Subdomain Untuk Host Bawaan"

echo -e " 11 ⸩  Perbarui Sertifikat V2RAY"

echo -e " 12 ⸩  Ubah Port All VPN"

echo -e " 13 ⸩  Autobackup Data VPS"

echo -e " 14 ⸩  Backup Data VPS"

echo -e " 15 ⸩  Restore Data VPS"

echo -e " 16 ⸩  Menu Webmin"

echo -e " 17 ⸩  Limit Bandwith Speed Server"

echo -e " 18 ⸩  Cek Penggunaan Ram VPS"

echo -e " 19 ⸩  Ganti Password VPS"

echo -e " 20 ⸩  Reboot VPS"

echo -e " 21 ⸩  Speedtest VPS"

echo -e " 22 ⸩  Informasi Display System"

echo -e " 23 ⸩  Info Script Auto Install"

echo -e " 24 ⸩  Restart All Service"

echo -e " 25 ⸩  Set Auto Reboot"

echo -e " 26 ⸩  Set Multi Login SSH"

echo -e " 27 ⸩  Restart Script"

echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"

echo -e "  x ⸩  Keluar Dari Putty / JuiceSSH / Termux"

echo -e "\e[32m══════════════════════════════════════════════════════════\e[m"

echo -e ""

read -p "       Masukkan Nomor  [1-27 / x] :  "  num

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

limit-speed

;;

18)

ram

;;

19)

passwd

;;

20)

reboot

;;

21)

speedtest

;;

22)

info

;;

23)

about

;;

24)

restart

;;

25)

auto-reboot

;;

26)

autokill

;;

27)

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
