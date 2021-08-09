#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "           ${green}PORT V2RAY VMESS${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port VMess TLS $tls"
echo -e "     2 ⸩  Ubah Port VMess NON-TLS $none"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e ""
echo -e "${green}"
read -p "Port Baru VMess TLS : " tls1
echo -e "${off}"
if [ -z $tls1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/config.json
sed -i "s/   - V2RAY Vmess TLS         : $tls/   - V2RAY Vmess TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray > /dev/null
echo -e "\e[032;1mPort $tls1 Berhasil Diperbarui\e[0m"
else
echo "Port $tls1 Sudah Digunakan"
fi
;;
2)
echo -e "${cyan}Masukkan Hanya Dua Angka (ex : 77)${off}"
echo -e ""
echo -e "${green}"
read -p "Port Baru VMess NON-TLS : " none1
echo -e "${off}"
if [ -z $none1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/none.json
sed -i "s/   - V2RAY Vmess None TLS    : $none/   - V2RAY Vmess None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@none > /dev/null
echo -e "${cyan}Port VMess TLS Berhasil Diganti Menjadi :${off} ${green} $none1 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $none1 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
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
