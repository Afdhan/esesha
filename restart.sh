#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "         ${green}RESTART SERVICES${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Mulai Ulang Services"
echo -e "     2 ⸩  Mulai Ulang OpenSSH"
echo -e "     3 ⸩  Mulai Ulang Dropbear"
echo -e "     4 ⸩  Mulai Ulang Stunnel4"
echo -e "     5 ⸩  Mulai Ulang OpenVPN"
echo -e "     6 ⸩  Mulai Ulang Squid"
echo -e "     7 ⸩  Mulai Ulang Nginx"
echo -e "     8 ⸩  Mulai Ulang BadVPN"
echo -e "     9 ⸩  Mulai Ulang WebSocket"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "    Masukkan Nomor  [1-9 / x] :  " Restart
echo -e "${off}"
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

                systemctl daemon-reload
                systemctl enable ws-dropbear.service
                systemctl enable ws-openssh.service
                systemctl enable ws-openvpn.service
                systemctl enable ws-stunnel.service

                systemctl restart ws-dropbear.service
                systemctl restart ws-openssh.service
                systemctl restart ws-openvpn.service
                systemctl restart ws-stunnel.service
                echo -e ""
                echo -e " Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e " SSH Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e " Dropbear Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e " Stunnel4 Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e " OpenVPN Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e " Squid3 Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e " Nginx Services Diperbarui" | lolcat
                echo -e ""
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
                echo -e " BadVPN Services Diperbarui" | lolcat
                echo -e ""
                exit
                ;;
                9)
                systemctl daemon-reload
                systemctl enable ws-dropbear.service
                systemctl enable ws-openssh.service
                systemctl enable ws-openvpn.service
                systemctl enable ws-stunnel.service

                systemctl restart ws-dropbear.service
                systemctl restart ws-openssh.service
                systemctl restart ws-openvpn.service
                systemctl restart ws-stunnel.service
                echo -e ""
                echo -e " WebSocket Services Diperbarui" | lolcat
                echo -e ""
                ;;
                x)
                clear
                exit
                ;;
        esac
