#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun $Login
sleep 0.5
echo Setting Password $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%d-%m-%Y"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Terima Kasih Telah Menggunakan Layanan Kami"
echo -e "Berikut Detail Akun SSH Dan OpenVPN"
echo -e "===============================" | lolcat
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "===============================" | lolcat
echo -e "Host           : $IP"
echo -e "ISP            : $ISP"
echo -e "CITY           : $CITY"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "Stunnel        :$ssl"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN        : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN        : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "badvpn         : 7100-7300"
echo -e "===============================" | lolcat
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Berakhir Pada  : $exp"
echo -e "Mod By M AFDHAN & NezaVPN"
