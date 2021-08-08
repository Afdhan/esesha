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
echo -e "           ${green}PANEL TROJAN${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Buat Akun Trojan"
echo -e "     2 ⸩  Hapus Akun Trojan"
echo -e "     3 ⸩  Perbarui Akun Trojan"
echo -e "     4 ⸩  Cek Login Trojan"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih nomor  [1-4 / x] :  " port
echo -e "${off}"

case $port in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 0.5
trj
;;
esac
