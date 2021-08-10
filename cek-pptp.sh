#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo " "
echo -e "${red}============================${NC}";
echo "     PPTP VPN USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
echo "Username   ---   IP" | lolcat
echo -e "${green}------------------------------------- ${NC}";
cat /tmp/login-db-pptp.txt
echo " "
echo -e "${red}============================${NC}";
echo " ";
