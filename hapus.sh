#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
read -p "Masukkan Username SSH Untuk Menghapus : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "Username $Pengguna Berhasil Dihapus."
else
        echo -e "Gagal, Username $Pengguna Tidak Ditemukan!."
fi