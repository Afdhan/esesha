#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Enable]${Font_color_suffix}"
Error="${Red_font_prefix}[Disable]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "  Status Auto Kill Saat Ini $sts        "
echo -e ""
echo -e "     [1]  Auto Kill 5 Minutes"
echo -e "     [2]  Auto Kill 10 Minutes"
echo -e "     [3]  Auto Kill 15 Minutes"
echo -e "     [4]  Nonaktifkan AutoKill MultiLogin"
echo -e "     [x]  Keluar"
echo -e ""
echo -e "======================================" | lolcat                                                                                                         
echo -e ""
read -p "     Pilih Nomor [1-4 / x] :  " AutoKill
read -p "     Multi Login Maximum : " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      Max Login          : $max"
                echo -e "      Auto Kill          : 5 Minutes"      
                echo -e ""
                echo -e "======================================" | lolcat                                                                                                                              
                exit                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      Max Login          : $max"
                echo -e "      Auto Kill          : 10 Minutes"
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      Max Login        : $max"
                echo -e "      Auto Kill        : 15 Minutes"
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                4)
                clear
                echo > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "  AutoKill MultiLogin Di Nonaktifkan "
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
