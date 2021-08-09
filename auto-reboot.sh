#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi

echo -e "${cyan}===============================${off}"
echo -e "       AUTO REBOOT SYSTEM " | lolcat
echo -e "${cyan}===============================${off}"
echo -e "${green}"
echo -e "   1 ⸩  Set Auto-Reboot Setiap 1 Jam"
echo -e "   2 ⸩  Set Auto-Reboot Setiap 6 Jam"
echo -e "   3 ⸩  Set Auto-Reboot Setiap 12 Jam"
echo -e "   4 ⸩  Set Auto-Reboot Setiap 1 Hari"
echo -e "   5 ⸩  Set Auto-Reboot Setiap 1 Minggu"
echo -e "   6 ⸩  Set Auto-Reboot Setiap 1 Bulan"
echo -e "   7 ⸩  Matikan Auto-Reboot"
echo -e "   8 ⸩  Lihat reboot log"
echo -e "   9 ⸩  Hapus reboot log"
echo -e "${off}"
echo -e "${cyan}===============================${off}"
echo -e "${green}"
read -p "   Pilih Nomor [1-9]: " x
echo -e "${off}"

if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 1 Jam.${off}"
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 6 Jam.${off}"
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 12 Jam.${off}"
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 1 Hari.${off}"
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 1 Minggu.${off}"
elif test $x -eq 6; then
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Diaktifkan Setiap 1 Bulan.${off}"
elif test $x -eq 7; then
rm -f /etc/cron.d/reboot_otomatis
echo -e "${green}Auto-Reboot Berhasil Dinonaktifkan.${off}"
elif test $x -eq 8; then
if [ ! -e /root/log-reboot.txt ]; then
	echo -e "${red}Tidak Ada Aktifitas Reboot${off}"
	else 
	echo -e "${cyan}LOG REBOOT${off}"
	echo -e"${green}-------"
	cat /root/log-reboot.txt
	echo -e "${off}"
fi
elif test $x -eq 9; then
echo "" > /root/log-reboot.txt
echo -e "${cyan}Log Reboot Berhasil Dihapus!${off}"
else
echo -e "${red}Pilihan Tidak Ada Menu!${off}"
sleep 1
clear
neofetch
exit 0
fi
