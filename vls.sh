#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel Vless | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun Vless Websocket"
echo -e "     [2]  Hapus Akun Vless Websocket"
echo -e "     [3]  Perbarui Akun Vless"
echo -e "     [4]  Cek Login Vless"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-4 / x] :  " port
echo -e ""
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
echo "Masukkan Nomor Yang Ada!"
sleep 0.5
vls
;;
esac
