#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel WG | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun Wireguard"
echo -e "     [2]  Hapus Akun Wireguard"
echo -e "     [3]  Cek Login Wireguard"
echo -e "     [4]  Perbarui Wireguard"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-4 / x] :  " port
echo -e ""
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
echo "Masukkan Nomor Yang Ada!"
sleep 0.5
wgg
;;
esac
