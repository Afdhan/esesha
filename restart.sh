#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e ""
echo -e "    [1] Mulai Ulang Services"
echo -e "    [2] Mulai Ulang OpenSSH"
echo -e "    [3] Mulai Ulang Dropbear"
echo -e "    [4] Mulai Ulang Stunnel4"
echo -e "    [5] Mulai Ulang OpenVPN"
echo -e "    [6] Mulai Ulang Squid"
echo -e "    [7] Mulai Ulang Nginx"
echo -e "    [8] Mulai Ulang Badvpn"
echo -e "    [x] Keluar"
echo -e ""
read -p "    Pilih Nomor  [1-8 / x] :  " Restart
echo -e ""
echo -e "======================================" | lolcat
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "          Services Diperbarui         "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         SSH Service Diperbarui        "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "       Dropbear Service Diperbarui     "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "        Stunnel4 Service Diperbarui    "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "       OpenVPN Service Diperbarui      "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "        Squid3 Service Diperbarui      "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         Nginx Service Diperbarui      "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                8)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Diperbarui  "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac