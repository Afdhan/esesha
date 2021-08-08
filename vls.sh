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
echo -e "          ${green}PANEL V2RAY VLESS${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Buat Akun Vless Websocket"
echo -e "     2 ⸩  Hapus Akun Vless Websocket"
echo -e "     3 ⸩  Perbarui Akun Vless"
echo -e "     4 ⸩  Cek Login Vless"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor [1-4 / x] :  " port
echo -e "${off}"

case $port in
1)
add-vless
;;
2)
del-vless
;;
3)
renew-vless
;;
4)
cek-vless
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
vls
;;
esac
