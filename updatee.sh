#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "Untuk Melakukan Tindakan Ini, Anda Harus Laporan Terlebih Dahulu Kepada Pihak Admin."
echo "Agar Diberikan Akses Pembaruan Pada Script VPS Anda!"
read -p "Sudah Laporan? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'N' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
elif [[ $arg == 'n' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
else
  echo "Argumen Tidak Diketahui!"
  sleep 1
  clear
  neofetch
  exit 0
fi
sleep 1

if [ ! -e /home/vps/public_html/TCP.ovpn ]; then
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/TCP.ovpn
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/UDP.ovpn
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/SSL.ovpn

mkdir /root/OpenVPN
cp -r /etc/openvpn/client-tcp-ssl.ovpn OpenVPN/SSL.ovpn
cp -r /etc/openvpn/client-udp-2200.ovpn OpenVPN/UDP.ovpn
cp -r /etc/openvpn/client-tcp-1194.ovpn OpenVPN/TCP.ovpn
cd /root
zip -r openvpn.zip OpenVPN > /dev/null 2>&1
cp -r /root/openvpn.zip /home/vps/public_html/ALL.zip
rm -rf /root/OpenVPN
rm -f /root/openvpn.zip
fi

wget -O /usr/bin/ssr https://raw.githubusercontent.com/Afdhan/esesha/main/ssrmu.sh && chmod +x /usr/bin/ssr
wget -O /usr/bin/add-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/add-ssr.sh && chmod +x /usr/bin/add-ssr
wget -O /usr/bin/del-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/del-ssr.sh && chmod +x /usr/bin/del-ssr
wget -O /usr/bin/renew-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/renew-ssr.sh && chmod +x /usr/bin/renew-ssr
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/add-l2tp.sh && chmod +x /usr/bin/add-l2tp
wget -O /usr/bin/del-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
wget -O /usr/bin/add-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/add-pptp.sh && chmod +x /usr/bin/add-pptp
wget -O /usr/bin/del-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/del-pptp.sh && chmod +x /usr/bin/del-pptp
wget -O /usr/bin/renew-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-pptp.sh && chmod +x /usr/bin/renew-pptp
wget -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp
wget -O /usr/bin/add-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/add-sstp.sh && chmod +x /usr/bin/add-sstp
wget -O /usr/bin/del-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/del-sstp.sh && chmod +x /usr/bin/del-sstp
wget -O /usr/bin/cek-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/cek-sstp.sh && chmod +x /usr/bin/cek-sstp
wget -O /usr/bin/renew-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-sstp.sh && chmod +x /usr/bin/renew-sstp

cd /usr/bin
wget -O add-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-ss.sh"
wget -O add-host "https://raw.githubusercontent.com/Afdhan/esesha/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Afdhan/esesha/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/Afdhan/esesha/main/menu.sh"
wget -O bw "https://raw.githubusercontent.com/Afdhan/esesha/main/bandwith.sh"
wget -O usernew "https://raw.githubusercontent.com/Afdhan/esesha/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Afdhan/esesha/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Afdhan/esesha/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Afdhan/esesha/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/Afdhan/esesha/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Afdhan/esesha/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/Afdhan/esesha/main/restart.sh"
wget -O info "https://raw.githubusercontent.com/Afdhan/esesha/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/Afdhan/esesha/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/Afdhan/esesha/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Afdhan/esesha/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Afdhan/esesha/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Afdhan/esesha/main/tendang.sh"
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
wget -O add-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-tr.sh"
wget -O certv2ray "https://raw.githubusercontent.com/Afdhan/esesha/main/cert.sh"
wget -O trialws "https://raw.githubusercontent.com/Afdhan/esesha/main/trialws.sh"
wget -O add-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-wg.sh"
wget -O status "https://raw.githubusercontent.com/Afdhan/esesha/main/status.sh"
wget -O clear-log "https://raw.githubusercontent.com/Afdhan/esesha/main/clear-log.sh"
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
chmod +x add-host
chmod +x menu
chmod +x bw
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
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
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x certv2ray
chmod +x trialws
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg
chmod +x status
chmod +x clear-log
cd
echo "1.0.1" > /home/ver
clear
figlet -f slant AFDHAN - NEZA | lolcat
sleep 5
clear
neofetch
