#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
figlet -f small Panel V2ray | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Vmess Websocket Account"
echo -e "     [2]  Delete Vmess Websocket Account"
echo -e "     [3]  Renew Vmess Account"
echo -e "     [4]  Check User Login Vmess"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
