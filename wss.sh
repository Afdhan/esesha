#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel V2ray | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun Vmess Websocket"
echo -e "     [2]  Buat Trial Vmess Websocket"
echo -e "     [3]  Hapus Akun Vmess Websocket"
echo -e "     [4]  Perbarui Akun Vmess"
echo -e "     [5]  Cek Login Vmess"
echo -e "     [x]  Keluar"
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-5 / x] :  " port
echo -e ""
case $port in
1)
add-ws
;;
2)
trialws
3)
del-ws
;;
4)
renew-ws
;;
5)
cek-ws
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 0.5
wss
;;
esac
