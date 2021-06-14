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
figlet -f small Panel SSH | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create SSH & OpenVPN Account"
echo -e "     [2]  Trial Account SSH & OpenVPN"
echo -e "     [3]  Renew SSH & OpenVPN Account"
echo -e "     [4]  Delete SSH & OpenVPN Account"
echo -e "     [5]  Check User Login SSH & OpenVPN"
echo -e "     [6]  Daftar Member SSH & OpenVPN"
echo -e "     [7]  Delete User Expired SSH & OpenVPN"
echo -e "     [8]  Set up Autokill SSH"
echo -e "     [9]  Cek Users Who Do Multi Login SSH"
echo -e "     [10] Restart Service Dropbear, Squid3"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-10 or x] :  " port
echo -e ""
case $port in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
