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
echo -e "         ${green}PANEL SSH & OVPN WS${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Buat Akun SSH & OpenVPN"
echo -e "     2 ⸩  Trial Akun SSH & OpenVPN"
echo -e "     3 ⸩  Perbarui Akun SSH & OpenVPN"
echo -e "     4 ⸩  Hapus Akun SSH & OpenVPN"
echo -e "     5 ⸩  Cek Login SSH & OpenVPN"
echo -e "     6 ⸩  Pengaturan AutoKill SSH"
echo -e "     7 ⸩  Cek User Multi Login SSH"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor [1-7 / x] :  " port
echo -e "${off}"

case $port in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
hapus
;;
5)
cek
;;
6)
autokill
;;
7)
ceklim
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
tessh
;;
esac
