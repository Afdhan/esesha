#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear

echo -e "${cyan}---------------------------------------------------${off}"
echo -e "USERNAME          EXP DATE          STATUS" | lolcat
echo -e "${cyan}---------------------------------------------------${off}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e ""
echo -e "${cyan}---------------------------------------------------${off}"
echo -e "  ${red}Jumlah :${off} ${green}[ $JUMLAH ]${off} ${red}User${off}"
echo -e "${cyan}---------------------------------------------------${off}"
echo -e ""

echo -e "${green}"
read -p " Username       :  " User
echo -e "${off}"
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo -e "${green}"
read -p "         Perpanjang (hari) :  " Days
echo -e "${off}"

Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo " ==========================" | lolcat
echo -e " Username          :  $User"
echo -e " Aktif Sampai       :  $Expiration_Display"
echo " ==========================" | lolcat
else
clear
echo -e ""
echo -e "   ${red}User Tidak Ditemukan!${off} "
sleep 2
menu
fi
