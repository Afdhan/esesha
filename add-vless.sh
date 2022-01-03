#!/bin/bash
grey='\x1b[90m'
red='\x1b[91m'
green='\x1b[92m'
yellow='\x1b[93m'
blue='\x1b[94m'
purple='\x1b[95m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
flag='\x1b[47;41m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Akses Diizinkan...${off}"
sleep 1
else
clear
echo -e "${red}Akses Diblokir!${off}"
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Remarks: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '2' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (hari): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/DhanZaa&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/DhanZaa&encryption=none&type=ws#${user}"
systemctl restart v2ray@vless
systemctl restart v2ray@vnone

cat > /etc/v2ray/vless-$user.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "net": "ws",
      "path": "/DhanZaa",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${blue} ~> V2RAY VLESS${off}"
echo -e "${red}=================================${off}"
echo -e " ISP            : ${ISP}"
echo -e " CITY           : ${CITY}"
echo -e " COUNTRY        : ${COUNTRY}"
echo -e " Remarks        : ${user}"
echo -e " Domain         : ${domain}"
echo -e " Port TLS       : $tls"
echo -e " Port NON-TLS   : $none"
echo -e " ID             : ${uuid}"
echo -e " Encryption     : none"
echo -e " Network        : ws"
echo -e " Path           : /DhanZaa"
echo -e "${red}=================================${off}"
echo -e "${blue}~> VLESS TLS${off}"
echo -e ""
echo -e "${vlesslink1}"
echo -e "${red}=================================${off}"
echo -e "${blue}~> VLESS NON-TLS${off}"
echo -e ""
echo -e "${vlesslink2}"
echo -e "${red}=================================${off}"
echo -e " Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "${red}=================================${off}"
echo -e " ${blue}- Mod By Dhansss X NezaVPN${off}"
echo -e ""
