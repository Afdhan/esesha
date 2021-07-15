#!/bin/bash
echo "==============================" | lolcat
echo ""
read -rp "Masukkan Domain: " -e DOMAIN
clear
echo "==============================" | lolcat
echo ""
echo "Domain Enable: $DOMAIN" 
echo ""
read -rp "Masukkan Subdomain: " -e sub
echo "Menganalisis Subomain..."
sleep 0.5
clear
SUB_DOMAIN=${sub}.${DOMAIN}
CF_ID=neza.afdhan@gmail.com
CF_KEY=c7ce6739f7548dcb626dcbee71140345f2625
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo "Pointing DNS Untuk Domain ${SUB_DOMAIN}..."
sleep 1
clear
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

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
echo "Host/Domain Berhasil Disimpan"
echo ""
echo "Domain Anda : $SUB_DOMAIN"
echo ""
echo "- Mod By M AFDHAN & NezaVPN" | lolcat
echo "IP=$SUB_DOMAIN" >> /var/lib/premium-script/ipvps.conf
figlet -f slant AFDHAN - NEZA | lolcat
