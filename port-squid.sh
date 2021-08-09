#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "             ${green}PORT SQUID${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Squid $sqd"
echo -e "     2 ⸩  Ubah Port Squid $sqd2"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Squid :  " squid
echo -e "${off}"
if [ -z $squid ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "${cyan}Port Squid Berhasil Diganti Menjadi :${off} ${green} $squid ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $squid ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Squid :  " squid
echo -e "${off}"
if [ -z $squid ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd2/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "${cyan}Port Squid Berhasil Diganti Menjadi :${off} ${green} $squid ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $squid ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
x)
exit
menu
;;
*)
echo -e "${red}Masukkan Nomor Yang Ada!${off}"
sleep 1
clear
menu
;;
esac

