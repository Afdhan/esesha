#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
wg="$(cat ~/log-install.txt | grep -i Wireguard | cut -d: -f2|sed 's/ //g')"
echo -e "${green}Ubah Port Wireguard Saat Ini${off} ${cyan}[ $wg ]${off}"
echo -e ""
echo -e "${green}"
read -p "Masukkan Port Baru Wireguard :  " wg2
echo -e "${off}"
if [ -z $wg2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $wg2)
if [[ -z $cek ]]; then
sed -i "s/$wg/$wg2/g" /etc/wireguard/wg0.conf
sed -i "s/$wg/$wg2/g" /etc/wireguard/params
sed -i "s/   - Wireguard               : $wg/   - Wireguard               : $wg2/g" /root/log-install.txt
iptables -D INPUT -i $NIC -p udp --dport $wg -j ACCEPT
iptables -I INPUT -i $NIC -p udp --dport $wg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl reload wg-quick@wg0 > /dev/null
echo -e "${cyan}Port SSTP Berhasil Diganti Menjadi :${off} ${green} $wg2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $wg2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
