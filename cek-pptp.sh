#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo " "
echo "${green}============================${NC}";
echo "     PPTP VPN USER LOGIN" | lolcat
echo "${green}============================${NC}";
echo "Username   ---   IP" | lolcat
echo "${red}------------------------------------- ${NC}";
cat /tmp/login-db-pptp.txt
echo " "
echo "${green}============================${green}";
echo " ";
