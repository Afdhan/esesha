echo "Mereset Script..."
sleep 0.5
wget https://raw.githubusercontent.com/Afdhan/esesha/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/Afdhan/esesha/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
echo "Reboot 5 Detik"
sleep 5
reboot
