#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
IZIN=$( curl http://akses.endka.ga:81/aksesku | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram t.me/Endka22"
rm -f setup.sh
exit 0
fi
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/Afdhan/esesha/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/Afdhan/esesha/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Afdhan/esesha/main/trial.sh"
wget -O change-port "https://raw.githubusercontent.com/Afdhan/esesha/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Afdhan/esesha/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Afdhan/esesha/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Afdhan/esesha/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Afdhan/esesha/main/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/Afdhan/esesha/main/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/Afdhan/esesha/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
