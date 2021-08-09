#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

read -rp "Masukkan Domain Anda : " -e host
sleep 1
pingg="ping $host"
if [[ $pingg == "" ]]; then
  echo -e "${red}Gagal! Domain Anda Tidak Aktif!${off}"
  echo -e "${green}Pastikan Domain Anda Sudah DiPointing Sebelumnya!${off}"
else
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "Berhasil Menambahkan Domain VPS" | lolcat
figlet -f slant AFDHAN - NEZA | lolcat
fi
