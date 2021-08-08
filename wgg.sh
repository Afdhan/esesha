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
echo -e "          ${green}PANEL WIREGUARD${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Buat Akun Wireguard"
echo -e "     2 ⸩  Hapus Akun Wireguard"
echo -e "     3 ⸩  Cek Login Wireguard"
echo -e "     4 ⸩  Perbarui Wireguard"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor [1-4 / x] :  " port
echo -e "${off}"

case $port in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
wgg
;;
esac
