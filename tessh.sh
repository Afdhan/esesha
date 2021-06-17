#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel SSH | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Buat Akun SSH & OpenVPN"
echo -e "     [2]  Trial Akun SSH & OpenVPN"
echo -e "     [3]  Perbarui Akun SSH & OpenVPN"
echo -e "     [4]  Hapus Akun SSH & OpenVPN"
echo -e "     [5]  Cek Login SSH & OpenVPN"
echo -e "     [6]  Daftar Pengguna SSH & OpenVPN"
echo -e "     [7]  Hapus Akun Expired SSH & OpenVPN"
echo -e "     [8]  Pengaturan AutoKill SSH"
echo -e "     [9]  Cek User Multi Login SSH"
echo -e "     [10] Restart Service Dropbear, Squid3"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-10 / x] :  " port
echo -e ""
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
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
clear
menu
;;
*)
echo "Masukkan Nomor Yang Ada!"
sleep 0.5
tessh
;;
esac
