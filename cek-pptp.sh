#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl http://akses.endka.ga:81/aksesku | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo " "
echo " "
echo "===========================================";
echo " "
echo " "
echo "-------------------------------------";
echo "    PPTP VPN User Login";
echo "-------------------------------------";
echo "Username   ---   IP";
echo "-------------------------------------";
cat /tmp/login-db-pptp.txt
echo " "
echo " "
echo " "
echo "===========================================";
echo " ";