#!/bin/bash
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "Berhasil Menambahkan Domain VPS"
figlet -f slant AFDHAN - NEZA | lolcat
