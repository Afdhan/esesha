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
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/stopwibu/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/stopwibu/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
tnggl=$(date +"%d-%B-%Y")
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%d-%B-%Y"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/stopwibu/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/stopwibu/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/stopwibu&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/stopwibu&encryption=none&type=ws#${user}"
systemctl restart stopwibu@vless
systemctl restart stopwibu@vnone
clear
echo -e ""
echo -e "=================================" | lolcat
echo -e "                   V2RAY/VLESS"
echo -e "=================================" | lolcat
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : $tls"
echo -e "port none TLS  : $none"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : ws"
echo -e "path           : /stopwibu"
echo -e "=================================" | lolcat
echo -e "                   VLESS TLS"
echo -e "---------------------------------" | lolcat
echo -e "  ${vlesslink1}"
echo -e "=================================" | lolcat
echo -e "                VLESS NON-TLS"
echo -e "---------------------------------" | lolcat
echo -e "  ${vlesslink2}"
echo -e "=================================" | lolcat
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada : $tnggl"
echo -e "Berakhir Pada : $exp"
echo -e "---------------------------------" | lolcat
echo -e "- Mod By M AFDHAN & NezaVPN"
