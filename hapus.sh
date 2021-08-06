#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "${red}---------------------------------------------------${NC}"
echo -e "USERNAME          EXP DATE          STATUS" | lolcat
echo -e "${red}---------------------------------------------------${NC}"
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
echo -e "${red}---------------------------------------------------${NC}"
echo -e "  Jumlah : ${green}[ $JUMLAH ]${NC} User"
echo -e "${red}---------------------------------------------------${NC}"
echo -e ""
read -p "Masukkan Username SSH Yang Ingin Dihapus : " userr
sleep 1
if getent passwd $userr > /dev/null 2>&1; then
        userdel $userr
        echo -e ""
        echo -e "User ${green}[ $userr ]${NC} Berhasil Dihapus."
        echo -e ""
else 
        echo -e ""
        echo -e "Gagal, User ${red}[ $userr ]${NC} Tidak Ditemukan!"
        echo -e ""
        sleep 3
        clear
        hapus
fi
