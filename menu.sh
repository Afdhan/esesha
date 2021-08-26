#!/bin/bash

clear
figlet -f slant AFDHAN - NEZA   VPN PROJECT \~ | lolcat
mer='\x1b[91m'
cyan='\x1b[96m'
off='\x1b[m'

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
        echo -e "${mer}OS TIDAK SUPPORT !!!${off}"
	echo -e "${mer}Scripy Install Hanya Bekerja Pada Operating System Debian, Ubuntu dan Centos${off}"
	exit 0
fi

declare -A nama_hari
nama_hari[Monday]="Senin"
nama_hari[Tuesday]="Selasa"
nama_hari[Wednesday]="Rabu"
nama_hari[Thursday]="Kamis"
nama_hari[Friday]="Jumat"
nama_hari[Saturday]="Sabtu"
nama_hari[Sunday]="Minggu"
hari_ini=`date +%A`


declare -A nama_bulan
nama_bulan[Jan]="Januari"
nama_bulan[Feb]="Februari"
nama_bulan[Mar]="Maret"
nama_bulan[Apr]="April"
nama_bulan[May]="Mei"
nama_bulan[Jun]="Juni"
nama_bulan[Jul]="Juli"
nama_bulan[Aug]="Agustus"
nama_bulan[Sep]="September"
nama_bulan[Oct]="Oktober"
nama_bulan[Nov]="November"
nama_bulan[Dec]="Desember"
bulan_ini=`date +%b`

color3='\e[031;1m'
color2='\e[34;1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
COUNTRY=$(curl -s ipinfo.io/country )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(TZ='Asia/Jakarta' date +%R)
hari=${nama_hari[$hari_ini]}
tnggl=$(date +"%d")
bln=${nama_bulan[$bulan_ini]}
thn=$(date +"%Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                    M AFDHAN - NEZAVPN " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${cyan}Zona Waktu             :  Asia/Jakarta ${NC}"
echo -e " ${cyan}Waktu                  :  $jam WIB ${NC}"
echo -e " ${cyan}Hari                   :  $hari ${NC}"
echo -e " ${cyan}Tanggal                :  $tnggl $bln $thn ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${cyan}Model CPU              : $cname ${NC}"
echo -e " ${cyan}Nomor Core             :  $cores ${NC}"
echo -e " ${cyan}Frekuensi CPU          : $freq MHz ${NC}"
echo -e " ${cyan}Jumlah RAM             :  $tram MB ${NC}"
echo -e " ${cyan}Jumlah Swap            :  $swap MB ${NC}"
echo -e " ${cyan}Waktu Aktif            : $up ${NC}"
echo -e " ${cyan}ISP                    :  $ISP ${NC}"
echo -e " ${cyan}COUNTRY                :  $COUNTRY ${NC}"
echo -e " ${cyan}CITY                   :  $CITY ${NC}"
echo -e " ${cyan}IP VPS                 :  $IPVPS ${NC}"
echo -e " ${cyan}Host VPS               :  $domain ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                      MENU TUNNELING " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${cyan}"
echo -e " 1 ⸩  Panel SSH & OVPN         5 ⸩  Panel SSR & Shadowsocks"
echo -e " 2 ⸩  Panel Wireguard          6 ⸩  Panel VMess"
echo -e " 3 ⸩  Panel L2TP & PPTP        7 ⸩  Panel VLess"
echo -e " 4 ⸩  Panel SSTP               8 ⸩  Panel Trojan"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                        MENU SYSTEM " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${cyan}"
echo -e "  9 ⸩  Masukkan Host          21 ⸩  Limit Speed"
echo -e " 10 ⸩  Record Domain          22 ⸩  Ram VPS"
echo -e " 11 ⸩  Sertifikat V2RAY       23 ⸩  Ganti Password"
echo -e " 12 ⸩  Ubah Port VPN          24 ⸩  Reboot"
echo -e " 13 ⸩  Autobackup VPS         25 ⸩  Speedtest"
echo -e " 14 ⸩  Backup VPS             26 ⸩  Informasi System"
echo -e " 15 ⸩  Restore VPS            27 ⸩  Info Script"
echo -e " 16 ⸩  Menu Webmin            28 ⸩  Restart Service"
echo -e " 17 ⸩  Auto Reboot            29 ⸩  Multi Login SSH"
echo -e " 18 ⸩  Edit Banner SSH        30 ⸩  Restart Script"
echo -e " 19 ⸩  Status Service         31 ⸩  Monitor Bandwith"
echo -e " 20 ⸩  Pointing VPS           32 ⸩  Bersihkan LOG"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "  ${cyan}x ⸩  Keluar Dari Terminal${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${cyan}"
read -p " [ # ] Masukkan Nomor Pilihanmu :  "  num
echo -e "${off}"

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
status
;;

20)
poin
;;

21)
limit-speed
;;

22)
ram
;;

23)
passwd
;;

24)
reboot
;;

25)
speedtest
;;

26)
info
;;

27)
about
;;

28)
restart
;;

29)
autokill
;;

30)
updatee
;;

31)
bw
;;

32)
clear-log
;;

x)
exit
;;

*)
echo -e "${mer}Nomor Yang Anda Masukkan Salah!${off}"
sleep 1
clear
menu
;;
esac
