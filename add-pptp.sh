#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Akses Diizinkan...${NC}"
sleep 1
else
clear
echo -e "${red}Akses Diblokir!${NC}";
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(cat /etc/v2ray/domain);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-pptp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-pptp"

echo -e ""
echo -e "================================" | lolcat
echo -e "==========[ PPTP VPN ]==========" | lolcat
echo -e "================================" | lolcat
echo -e "Server Host   : $PUBLIC_IP"
echo -e "Server IP     : $MYIP"
echo -e "Username      : $VPN_USER"
echo -e "Password      : $VPN_PASSWORD"
echo -e "================================" | lolcat
echo -e "Aktif Selama  : $masaaktif Hari"
echo -e "Dibuat Pada   : $tnggl"
echo -e "Berakhir Pada : $expe"
echo -e "================================" | lolcat
echo -e "- Mod By Dhansss X NezaVPN"
echo -e ""
