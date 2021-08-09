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
echo -e "          ${green}PANEL L2TP & PPTP${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Buat Akun L2TP"
echo -e "     2 ⸩  Buat Akun PPTP"
echo -e "     3 ⸩  Hapus Akun L2TP"
echo -e "     4 ⸩  Hapus Akun PPTP"
echo -e "     5 ⸩  Cek Login PPTP"
echo -e "     6 ⸩  Perbarui Akun L2TP"
echo -e "     7 ⸩  Perbarui Akun PPTP"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih nomor  [1-7 / x] :  " port
echo -e "${off}"

case $port in
1)
add-l2tp
;;
2)
add-pptp
;;
3)
del-l2tp
;;
4)
del-pptp
;;
5)
cek-pptp
;;
6)
renew-l2tp
;;
7)
renew-pptp
;;
x)
clear
menu
;;
*)
echo -e "${red}Nomor Yang Anda Masukkan Salah!${off}"
sleep 1
ltp
;;
esac
