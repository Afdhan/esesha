echo "Mereset Script..."
echo "Yakin Mau Reset Script?"
read -p "Ketik (Y): " rd
if [ rd = "Y" ] then
echo "Silahkan Tunggu..."
elif 
exit 1
fi
sleep 0.5
wget https://afdhan.github.io/sce/Esesha.sh && chmod +x Esesha.sh && ./Esesha.sh
rm -f Esesha.sh
echo "Reboot 5 Detik"
sleep 5
reboot
