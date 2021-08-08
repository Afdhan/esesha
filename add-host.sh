#!/bin/bash
read -rp "Masukkan Domain Anda : " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "Berhasil Menambahkan Domain VPS" | lolcat
figlet -f slant AFDHAN - NEZA | lolcat
