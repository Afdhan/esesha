#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "            ${green}PENGATURAN PORT${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Stunnel4"
echo -e "     2 ⸩  Ubah Port OpenVPN"
echo -e "     3 ⸩  Ubah Port Wireguard"
echo -e "     4 ⸩  Ubah Port Vmess"
echo -e "     5 ⸩  Ubah Port Vless"
echo -e "     6 ⸩  Ubah Port Trojan"
echo -e "     7 ⸩  Ubah Port Squid"
echo -e "     8 ⸩  Ubah Port SSTP"
echo -e "     9 ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor [1-8 / x] :  " port
echo -e "${off}"

case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-tr
;;
7)
port-squid
;;
8)
port-sstp
;;
x)
clear
menu
;;
*)
echo "Masukkan Nomor Yang Ada!"
sleep 1
change-port
;;
esac
