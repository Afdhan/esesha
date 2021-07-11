#!/bin/bash
echo "==============================" | lolcat
echo ""
echo "Domain Bawaan Script: nezavpn.com" 
echo ""
read -rp "Masukkan Subdomain: " -e sub
echo "Menganalisis Subomain..."
sleep 0.5
clear
DOMAIN=nezavpn.com
SUB_DOMAIN=${sub}.${DOMAIN}
CF_ID=muhammad.neizam@gmail.com
CF_KEY=0783093590c2f3eebc8d016382f92c2d10897
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
