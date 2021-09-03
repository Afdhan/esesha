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

read -e -p "Username :" ssr_user
CLIENT_EXISTS=$(grep -w $ssr_user /usr/local/shadowsocksr/akun.conf | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
exit 1
fi
read -p "Expired (hari): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
lastport=$(cat /usr/local/shadowsocksr/mudb.json | grep '"port": ' | tail -n1 | awk '{print $2}' | cut -d "," -f 1 | cut -d ":" -f 1 )
if [[ $lastport == '' ]]; then
ssr_port=1443
else
ssr_port=$((lastport+1))
fi
ssr_password="$ssr_user"
ssr_method="aes-256-cfb"
ssr_protocol="origin"
ssr_obfs="tls1.2_ticket_auth_compatible"
ssr_protocol_param="2"
ssr_speed_limit_per_con=0
ssr_speed_limit_per_user=0
ssr_transfer="838868"
ssr_forbid="bittorrent"
cd /usr/local/shadowsocksr
match_add=$(python mujson_mgr.py -a -u "${ssr_user}" -p "${ssr_port}" -k "${ssr_password}" -m "${ssr_method}" -O "${ssr_protocol}" -G "${ssr_protocol_param}" -o "${ssr_obfs}" -s "${ssr_speed_limit_per_con}" -S "${ssr_speed_limit_per_user}" -t "${ssr_transfer}" -f "${ssr_forbid}"|grep -w "add user info")
cd
echo -e "${Info} Penambahan user berhasil [username: ${ssr_user}]"
echo -e "### $ssr_user $exp" >> /usr/local/shadowsocksr/akun.conf
tmp1=$(echo -n "${ssr_password}" | base64 -w0 | sed 's/=//g;s/\//_/g;s/+/-/g')
SSRobfs=$(echo ${ssr_obfs} | sed 's/_compatible//g')
tmp2=$(echo -n "$MYIP:${ssr_port}:${ssr_protocol}:${ssr_method}:${SSRobfs}:${tmp1}/obfsparam=" | base64 -w0)
ssr_link="ssr://${tmp2}"
/etc/init.d/ssrmu restart
service cron restart
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${blue} ~> SHADOWSOCKSR SSR${off}"
echo -e "${red}=================================${off}"
echo -e " ISP           : $ISP"
echo -e " CITY          : $CITY"
echo -e " COUNTRY       : $COUNTRY"
echo -e " Server IP     : ${MYIP}"
echo -e " Host          : ${domain}"
echo -e " Port          : ${ssr_port}"
echo -e " Password      : ${ssr_password}"
echo -e " Encryption    : ${ssr_method}"
echo -e " Protocol      : ${ssr_protocol}"
echo -e " Obfs          : ${ssr_obfs}"
echo -e " Device limit  : ${ssr_protocol_param}"
echo -e "${red}=================================${off}"
echo -e "${blue}~> LINK  SSR${off}"
echo -e ""
echo -e "${ssr_link}"
echo -e "${red}=================================${off}"
echo -e " Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "${red}=================================${off}"
echo -e " ${blue}- Mod By Dhansss X NezaVPN${off}"
echo -e ""
