#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel SSR | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun SSR"
echo -e "     [2]  Buat Akun Shadowsocks"
echo -e "     [3]  Hapus Akun SSR"
echo -e "     [4]  Hapus Akun Shadowsocks"
echo -e "     [5]  Perbarui Akun SSR Aktif"
echo -e "     [6]  Perbarui Akun Shadowsocks Aktif"
echo -e "     [7]  Cek Login Shadowsocks"
echo -e "     [8]  Lihat Menu Lengkap SSR"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-8 / x] :  " port
echo -e ""
case $port in
1)
add-ssr
;;
2)
add-ss
;;
3)
del-ssr
;;
4)
del-ss
;;
5)
renew-ssr
;;
6)
renew-ss
;;
7)
cek-ss
;;
8)
ssr
;;
x)
clear
menu
;;
*)
echo "Masukkan Nomor Yang Ada!"
sleep 0.5
sssr
;;
esac
