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

DM1=dhans-project.xyz
DM2=dhans-vpn.eu.org
DM3=nezavpn.my.id

echo -e "${cyan}=================================${off}"
echo -e "      SILAHKAN PILIH DOMAIN " | lolcat
echo -e "${cyan}=================================${off}"
echo -e "$green"
echo -e "    1 ⸩  dhans-project.xyz"
echo -e "    2 ⸩  dhans-vpn.eu.org"
echo -e "    1 ⸩  nezavpn.my.id $off"
echo -e "---------------------------------" | lolcat
echo -e "    ${green}0 ⸩  Custom domain ${off}"
echo -e "    ${green}x ⸩  Keluar ${off}"
echo -e "${cyan}=================================${off}"
echo ""
read -p "   [#]  Masukkan Nomor :  " nom

if [[ $nom == '1' ]]; then
   DOMAIN=dhans-project.xyz
   CF_ID=afdhan134@gmail.com
   CF_KEY=57fc95a923222474d5b90ff5444e0ee6f19ef
elif [[ $nom == '2' ]]; then
   DOMAIN=dhans-vpn.eu.org
   CF_ID=afdhan134@gmail.com
   CF_KEY=57fc95a923222474d5b90ff5444e0ee6f19ef
elif [[ $nom == '3' ]]; then
   DOMAIN=nezavpn.my.id
   CF_ID=neza.afdhan@gmail.com
   CF_KEY=c7ce6739f7548dcb626dcbee71140345f2625
elif [[ $nom == '0' ]]; then
   echo -e "${green}Anda Harus Mempunyai Email Akun Cloudflare Dan Domain Aktif!${off}"
   echo -e "${green}Untuk Api Key Bisa Anda Dapat Di Profil Akun Cloudflare Anda.${off}"
   sleep 1
   echo ""
   read -rp "Masukkan Domain Anda : " -e DOMAIN
   if [[ $DOMAIN == $DM1 ]] || [[ $DOMAIN == $DM2 ]] || [[ $DOMAIN == $DM3 ]]; then
   sleep 1
   echo -e "${red}Masukkan Domain Mu Sendiri! Bukan Domain System!!!${off}"
   sleep 1
   echo ""
   exit 0
   fi
sleep 0.5
   echo ""
   read -rp "Masukkan Email Cloudflare : " -e CF_ID
sleep 0.5
   echo ""
   read -rp "Masukkan Api Key Cloudflare : " -e CF_KEY
clear
elif [[ $nom == 'x' ]]; then
   clear
   menu
else
   echo -e "${red}Masukkan Nomor Yang Benar!${off}"
   sleep 1
   clear
   hostnya
fi
sleep 1
echo -e "${green}Domain Input : ${DOMAIN} ${off}"
echo -e ""
read -rp "Masukkan Subdomain: " -e sub
echo -e "${green}Menganalisis Subomain...${off}"
sleep 0.5
clear

SUB_DOMAIN=${sub}.${DOMAIN}
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo -e "${green}Pointing DNS Untuk Domain ${SUB_DOMAIN}...${off}"
sleep 1
clear
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
     
if [[ $ZONE == 'null' ]] || [[ $ZONE == "" ]]; then
  echo -e "${red}ERROR!${off} ${cyan}Result Gagal, Kemungkinan Api Key Tidak Valid!${off}"
  sleep 1
  exit 0
fi

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
   
hasil='ping $SUB_DOMAIN' | grep -i $IP 
if [[ $hasil == $IP ]]; then

sleep 0.5
echo -e ""
echo -e "${cyan}DOMAIN BERHASIL DISIMPAN${off}"
echo -e ""
echo -e "${cyan}Domain Anda Sekarang :${off} ${green}$SUB_DOMAIN${off}"
echo -e ""
echo "- Mod By Dhansss X NezaVPN" | lolcat
echo "IP=$SUB_DOMAIN" >> /var/lib/premium-script/ipvps.conf
else
echo -e "${red}ERROR! Domain Anda Tidak Dapat Di Record, Harap Periksa Kembali!${off}"
  echo ""
  exit 0
fi
