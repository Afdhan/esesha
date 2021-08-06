#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Akses Diizinkan...${NC}"
sleep 1
else
clear
echo -e "${red}Akses Diblokir!${NC}";
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
Pass=`</dev/urandom tr -dc 0-9 | head -c2`
useradd -e `date -d "1 days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "=================================" | lolcat
echo -e "=====[ Trial SSH & OpenVPN ]=====" | lolcat
echo -e "=================================" | lolcat
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Hostname       : $domain"
echo -e "=================================" | lolcat
echo -e "Server IP      : $MYIP"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "Stunnel        :$ssl"
echo -e "WS Dropbear    : 2095"
echo -e "WS OpenSSH     : 2082"
echo -e "WS OpenVPN     : 2086"
echo -e "WS TLS         : 2053"
echo -e "Squid          :$sqd"
echo -e "BadVPN         : 7100, 7200, 7300"
echo -e "=================================" | lolcat
echo -e "=======[ Configs OpenVPN ]=======" | lolcat
echo -e ""
echo -e "TCP $ovpn       : http://$domain:81/client-tcp-$ovpn.ovpn"
echo -e "UDP $ovpn2       : http://$domain:81/client-udp-$ovpn2.ovpn"
echo -e "SSL 442        : http://$domain:81/client-tcp-ssl.ovpn"
echo -e "ZIP FILE       : http://$domain:81/all-ovpn.zip"
echo -e "=================================" | lolcat
echo -e "======[ Payload WebSocket ]======" | lolcat
echo -e ""
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================" | lolcat
echo -e "Aktif Selama   : 1 Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $expe"
echo -e "=================================" | lolcat
echo -e "- Mod By Dhansss X NezaVPN"
echo -e ""
