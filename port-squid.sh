#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Ubah Port $sqd"
echo -e "     [2]  Ubah Port $sqd2"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e ""
case $prot in
1)
read -p "Port Baru Squid: " squid
if [ -z $squid ]; then
echo "Masukkan Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "\e[032;1mPort $squid modified successfully\e[0m"
else
echo "Port $squid Sudah Digunakan!"
fi
;;
2)
read -p "Port Baru Squid: " squid
if [ -z $squid ]; then
echo "Masukkan Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd2/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "\e[032;1mPort $squid modified successfully\e[0m"
else
echo "Port $squid Sudah Digunakan!"
fi
;;
x)
exit
menu
;;
*)
echo "Masukkan Nomor Yang Ada!"
;;
esac

