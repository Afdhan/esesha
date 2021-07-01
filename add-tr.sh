#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${green}Akses Diizinkan...${NC}"
else
echo -e "${red}Akses Diblokir!${NC}";
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/stopwibu/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -i Trojan | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%d-%B-%Y"`
tnggl=$(date +"%d-%B-%Y")
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:${tr}?sni=bug-anda.com#trojan"
clear
echo -e ""
echo -e "=================================" | lolcat
echo -e "                    TROJAN VPN"
echo -e "=================================" | lolcat
echo -e "Remarks        : ${user}"
echo -e "IP               : ${MYIP}"
echo -e "Host         : ${domain}"
echo -e "port           : ${tr}"
echo -e "Key            : ${user}"
echo -e "link           : ${trojanlink}"
echo -e "=================================" | lolcat
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada : $tnggl"
echo -e "Berakhir Pada : $exp"
echo -e "---------------------------------" | lolcat
echo -e "- Mod By M AFDHAN & NezaVPN"
