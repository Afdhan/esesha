#!/usr/bin/bash
echo "Yakin Mau Reset Script?"
read -p "Ketik (Y): " rd
if [ $rd == "Y" ]; then
echo "Mereset Script..."
echo "Silahkan Tunggu..."
else 
echo "Perintah Dibatalkan!"
exit 0
fi
sleep 0.5
# Ketika Saya Gabut, Inilah Hasilnya.. Aowkwkwkwkwk
wget https://afdhan.github.io/sce/Esesha.sh && chmod +x Esesha.sh && ./Esesha.sh
rm -f Esesha.sh
echo "Reboot 5 Detik"
sleep 5
reboot
