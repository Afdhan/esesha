#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://afdhan.github.io/sce/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
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
# Load params
source /etc/wireguard/params
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(cat /etc/v2ray/domain);
else
SERVER_PUB_IP=$IP
fi
	
	until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e CLIENT_NAME
		CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
	ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
	WG_CONFIG="/etc/wireguard/wg0.conf"
	LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
	if [[ "$LASTIP" = "" ]]; then
	CLIENT_ADDRESS="10.66.66.2"
	else
	CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
	fi

	# Adguard DNS by default
	CLIENT_DNS_1="176.103.130.130"

	CLIENT_DNS_2="176.103.130.131"
	
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
	# Generate key pair for the client
	CLIENT_PRIV_KEY=$(wg genkey)
	CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
	CLIENT_PRE_SHARED_KEY=$(wg genpsk)

	# Create client file and add the server as a peer
	echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

	# Add the client as a peer to the server
	echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
	systemctl restart "wg-quick@$SERVER_WG_NIC"
	cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
	clear
        sleep 1
	echo -e ""
	echo -e "=================================" | lolcat
        echo -e "            WIREGUARD"
        echo -e "=================================" | lolcat
        echo -e "Server IP      : $MYIP"
        echo -e "Server Host    : $SERVER_PUB_IP"
        echo -e "=================================" | lolcat
	echo -e "WireGuard URL 	: http://$SERVER_PUB_IP:81/$CLIENT_NAME.conf"
	echo -e "=================================" | lolcat
	echo -e "Aktif Selama   : $masaaktif Hari"
        echo -e "Dibuat Pada    : $tnggl"
        echo -e "Berakhir Pada  : $expe"
        echo -e "---------------------------------" | lolcat
        echo -e "- Mod By M AFDHAN & NezaVPN"
        echo -e ""
	rm -f /root/wg0-client-$CLIENT_NAME.conf
