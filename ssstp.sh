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
figlet -f small Panel SSTP | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Account SSTP"
echo -e "     [2]  Delete SSTP Account"
echo -e "     [3]  Renew SSTP Account"
echo -e "     [4]  Check User Login SSTP"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
add-sstp
;;
2)
del-sstp
;;
3)
renew-sstp
;;
4)
cek-sstp
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
