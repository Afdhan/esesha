#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email"
read -rp "Email: " -e email
cat <<EOF>>/home/email
$email
EOF
fi
cat << EOF >> /etc/crontab
# BEGIN_Backup
5 0 * * * root bckp
# END_Backup
EOF
service cron restart
sleep 1
echo " Harap Tunggu"
clear
echo " Autobackup Dimulai"
echo " Data Otomatis Dibackup Pada Pukul 00:05 GMT +7"
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Backup/,/^# END_Backup/d" /etc/crontab
service cron restart
sleep 1
echo " Harap Tunggu"
clear
echo " Autobackup Dihentikan"
exit 0
}
clear
echo -e " ==============================" | lolcat
echo -e "          Autobackup Data       "
echo -e " ==============================" | lolcat
echo -e " Status : $sts"
echo -e "  1. Start Autobackup"
echo -e "  2. Stop Autobackup"
echo -e " Klik CTRL+C untuk return"
read -rp " Pilih Nomor : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo " Nomor Yang Anda Masukkan Salah"
menu
fi
