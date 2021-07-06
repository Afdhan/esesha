#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${green}Akses Diizinkan...${NC}"
else
echo -e "${red}Akses Diblokir!${NC}";
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
drop="$(cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2)"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ws="$(cat ~/log-install.txt | grep -w "WebSocket" | cut -d: -f2)"
bad="$(cat ~/log-install.txt | grep -w "Badvpn" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo Membuat Akun $Login
sleep 0.5
echo Setting Password $Pass
sleep 0.5
clear
tnggl=$(date +"%d-%B-%Y")
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "=================================" | lolcat
echo -e "          SSH & OpenVPN "
echo -e "=================================" | lolcat
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Domain         : $domain"
echo -e "=================================" | lolcat
echo -e "Host/IP        : $MYIP"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : $drop"
echo -e "Stunnel        : $ssl"
echo -e "WebSocket      : $ws"
echo -e "Squid          : $sqd"
echo -e "BadVPN         : $bad"
echo -e "=================================" | lolcat
echo -e "         Config OpenVPN"
echo -e "=================================" | lolcat
echo -e "TCP $ovpn      : http://$domain:81/client-tcp-$ovpn.ovpn"
echo -e "UDP $ovpn2     : http://$domain:81/client-udp-$ovpn2.ovpn"
echo -e "SSL 442        : http://$domain:81/client-tcp-ssl.ovpn"
echo -e "ZIP FILE       : http://$domain:81/all-ovpn.zip"
echo -e "=================================" | lolcat
echo -e "        Setting WebSocket"
echo -e "=================================" | lolcat
echo -e "Setting Payload "
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e ""
echo -e "Setting SSH "
echo -e "bimbel.ruangguru.com:$ws@$Login:$Pass"
echo -e "=================================" | lolcat
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $exp"
echo -e "---------------------------------" | lolcat
echo -e "- Mod By M AFDHAN & NezaVPN"
