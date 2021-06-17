#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
wg="$(cat ~/log-install.txt | grep -i Wireguard | cut -d: -f2|sed 's/ //g')"
echo -e "      Change Port $wg"
read -p "Port Baru Wireguard: " wg2
if [ -z $wg2 ]; then
echo "Masukkan Port!"
exit 0
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
echo -e "\e[032;1mPort $wg2 Berhasil Diubah\e[0m"
else
echo "Port $wg2 Sudah Digunakan"
fi
