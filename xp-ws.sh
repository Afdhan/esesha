#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

data=( `cat /etc/v2ray/config.json | grep '^### Trial' | cut -d ' ' -f 2`);
jam=$(date +'%R')
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$jam" +%s)
exp2=$(( (d1 - d2) / 3600 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/none.json
rm -f /etc/v2ray/$user-tls.json /etc/v2ray/$user-none.json
systemctl restart v2ray
systemctl restart v2ray@none
fi
done
