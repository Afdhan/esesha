#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tr="$(cat ~/log-install.txt | grep -i Trojan | cut -d: -f2|sed 's/ //g')"
echo -e "${green}Ubah Port Trojan Saat Ini${off} ${cyan}[ $tr ]${off}"
echo -e ""
echo -e "${green}"
read -p "Masukkan Port Baru Trojan :  " tr2
echo -e "${off}"
if [ -z $tr2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$tr/$tr2/g" /etc/trojan/config.json
sed -i "s/   - Trojan                  : $tr/   - Trojan                  : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
echo -e "${cyan}Port Trojan Berhasil Diganti Menjadi :${off} ${green} $tr2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tr2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
