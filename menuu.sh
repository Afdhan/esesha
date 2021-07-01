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

echo -e "                      MENU SYSTEM " | lolcat

echo -e "${green}═══════════════════════════════════════════════════════════${NC}"

echo -e " 1 ⸩  Masukkan Domain/Host              11 ⸩  Limit Bandwith Server"

echo -e "  2 ⸩  Masukkan Subdomain               12 ⸩  Cek Ram VPS"

echo -e "  3 ⸩  Perbarui Sertifikat V2RAY        13 ⸩  Ganti Password VPS"

echo -e "  4 ⸩  Ubah Port VPN                    14 ⸩  Reboot VPS"

echo -e "  5 ⸩  Autobackup Data VPS              15 ⸩  Speedtest VPS"

echo -e "  6 ⸩  Backup Data VPS                  16 ⸩  Informasi Display System"

echo -e "  7 ⸩  Restore Data VPS                 17 ⸩  Info Script Auto Install"

echo -e "  8 ⸩  Menu Webmin                      18 ⸩  Restart Service"

echo -e "  9 ⸩  Atur Auto Reboot                 19 ⸩  Atur Multi Login SSH"

echo -e " 10 ⸩  Edit Banner SSH                  20 ⸩  Restart Script"

echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e "  0 ⸩ Kembali Ke Menu Utama              x ⸩  Keluar Dari Terminal"

echo -e "${green}══════════════════════════════════════════════════════════${NC}"

echo -e ""

read -p "  [ # ] Masukkan Nomor Pilihanmu :  "  num

echo -e ""

case $num in

1)

add-host

;;

2)

hostnya

;;

3)

certv2ray

;;

4)

change-port

;;

5)

autobackup

;;

6)

backup

;;

7)

restore

;;

8)

wbmn

;;

9)

limit-speed

;;

10)

ram

;;

11)

passwd

;;

12)

reboot

;;

13)

speedtest

;;

14)

info

;;

15)

about

;;

16)

restart

;;

17)

auto-reboot

;;

18)

autokill

;;

19)

nano /etc/banner.net

;;

20)

updatee

;;

0)

menu

;;

x)

exit

;;

*)

echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
clear
menuu

;;

esac
