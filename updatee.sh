#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "Memperbarui..."
sleep 0.5
wget https://raw.githubusercontent.com/Afdhan/esesha/main/edukasi.sh && chmod +x edukasi.sh && ./edukasi.sh && rm -f edukasi.sh
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/Afdhan/esesha/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Afdhan/esesha/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/Afdhan/esesha/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/Afdhan/esesha/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Afdhan/esesha/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Afdhan/esesha/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Afdhan/esesha/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/Afdhan/esesha/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Afdhan/esesha/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/Afdhan/esesha/main/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/Afdhan/esesha/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Afdhan/esesha/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/Afdhan/esesha/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/Afdhan/esesha/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Afdhan/esesha/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Afdhan/esesha/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Afdhan/esesha/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/Afdhan/esesha/main/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/Afdhan/esesha/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Afdhan/esesha/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Afdhan/esesha/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Afdhan/esesha/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Afdhan/esesha/main/xp.sh"
wget -O kernel-updt "https://raw.githubusercontent.com/Afdhan/esesha/main/kernel-update.sh"
wget -O tessh "https://raw.githubusercontent.com/Afdhan/esesha/main/tessh.sh"
wget -O ssstp "https://raw.githubusercontent.com/Afdhan/esesha/main/ssstp.sh"
wget -O sssr "https://raw.githubusercontent.com/Afdhan/esesha/main/sssr.sh"
wget -O ltp "https://raw.githubusercontent.com/Afdhan/esesha/main/ltp.sh"
wget -O wgg "https://raw.githubusercontent.com/Afdhan/esesha/main/wgg.sh"
wget -O trj "https://raw.githubusercontent.com/Afdhan/esesha/main/trj.sh"
wget -O wss "https://raw.githubusercontent.com/Afdhan/esesha/main/wss.sh"
wget -O vls "https://raw.githubusercontent.com/Afdhan/esesha/main/vls.sh"
wget -O updatee "https://raw.githubusercontent.com/Afdhan/esesha/main/updatee.sh"
wget -O hostnya "https://raw.githubusercontent.com/Afdhan/esesha/main/host.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/Afdhan/esesha/main/auto-reboot.sh"
chmod +x add-host
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x kernel-updt
chmod +x tessh
chmod +x ssstp
chmod +x sssr
chmod +x ltp
chmod +x wgg
chmod +x trj
chmod +x wss
chmod +x vls
chmod +x updatee
chmod +x hostnya
chmod +x auto-reboot
echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
cd
echo "1.0.1" > /home/ver
clear
echo " Script Berhasil Di Restart"
echo " Sekarang Kamu Bisa Ubah Port Di Beberapa Layanan VPN"
echo " Reboot 5 Detik"
sleep 5
rm -f update.sh
reboot
