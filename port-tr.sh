#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tr="$(cat ~/log-install.txt | grep -i TrojanGFW | cut -d: -f2|sed 's/ //g')"
trg="$(cat ~/log-install.txt | grep -i TrojanGO | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "           ${green}PORT TROJAN${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Trojan-GFW $tr"
echo -e "     2 ⸩  Ubah Port Trojan-GO $trg"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"
case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Trojan-GFW :  " tr2
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
sed -i "s/   - TrojanGFW               : $tr/   - TrojanGFW               : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
echo -e "${cyan}Port Trojan-GFW Berhasil Diganti Menjadi :${off} ${green} $tr2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tr2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Trojan-GO :  " trg2
echo -e "${off}"
if [ -z $trg2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek2=$(netstat -nutlp | grep -w $trg2)
if [[ -z $cek2 ]]; then
sed -i "s/$trg/$trg2/g" /etc/trojan-go/config.json
sed -i "s/   - TrojanGO                : $tr/   - TrojanGO                : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trg -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trg -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trg2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
echo -e "${cyan}Port Trojan-GO Berhasil Diganti Menjadi :${off} ${green} $tr2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tr2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 1
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
