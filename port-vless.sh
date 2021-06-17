#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Ubah Port Vless TLS $tls"
echo -e "     [2]  Ubah Port Vless None TLS $none"
echo -e "     [x]  Keluar"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e ""
case $prot in
1)
read -p "Port Baru Vless TLS: " tls1
if [ -z $tls1 ]; then
echo "Masukkan Port!"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/vless.json
sed -i "s/   - V2RAY Vless TLS         : $tls/   - V2RAY Vless TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@vless > /dev/null
echo -e "\e[032;1mPort $tls1 modified successfully\e[0m"
else
echo "Port $tls1 Sudah Digunakan!"
fi
;;
2)
read -p "Port Baru Vless None TLS: " none1
if [ -z $none1 ]; then
echo "Masukkan Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/vnone.json
sed -i "s/   - V2RAY Vless None TLS    : $none/   - V2RAY Vless None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@vnone > /dev/null
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo "Port $none1 Sudah Digunakan!"
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
