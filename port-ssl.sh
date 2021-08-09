#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
ssl="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $1}')"
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "            ${green}PORT STUNNEL${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Stunnel $ssl"
echo -e "     2 ⸩  Ubah Port Stunnel $ssl2"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Stunnel4 :  " stl
echo -e "${off}"
if [ -z $stl ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $stl, $ssl2/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "${cyan}Port Stunnel4 Berhasil Diganti Menjadi :${off} ${green} $stl ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $stl ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Stunnel4 :  " stl
echo -e "${off}"
if [ -z $stl ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl2/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $ssl, $stl/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "${cyan}Port Stunnel4 Berhasil Diganti Menjadi :${off} ${green} $stl ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $stl ]${off} ${red}Sudah Beroperasi Pada System!${off}"
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
