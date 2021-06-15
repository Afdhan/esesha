#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Start Patch"
echo "Fix Curl IP Address"
cd /usr/bin
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
wget -O autobackup "https://raw.githubusercontent.com/Afdhan/esesha/main/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/Afdhan/esesha/main/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/Afdhan/esesha/main/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/Afdhan/esesha/main/restore.sh"
wget -O strt "https://raw.githubusercontent.com/Afdhan/esesha/main/strt.sh"
wget -O limit-speed "https://raw.githubusercontent.com/Afdhan/esesha/main/limit-speed.sh"
wget -O add-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-ss.sh"
wget -O add-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Afdhan/esesha/main/renew-wg.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
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
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/add-l2tp.sh && chmod +x /usr/bin/add-l2tp
wget -O /usr/bin/del-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
wget -O /usr/bin/add-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/add-pptp.sh && chmod +x /usr/bin/add-pptp
wget -O /usr/bin/del-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/del-pptp.sh && chmod +x /usr/bin/del-pptp
wget -O /usr/bin/renew-pptp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-pptp.sh && chmod +x /usr/bin/renew-pptp
wget -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp
wget -O /usr/bin/ssr https://raw.githubusercontent.com/Afdhan/esesha/main/ssrmu.sh && chmod +x /usr/bin/ssr
wget -O /usr/bin/add-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/add-ssr.sh && chmod +x /usr/bin/add-ssr
wget -O /usr/bin/del-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/del-ssr.sh && chmod +x /usr/bin/del-ssr
wget -O /usr/bin/renew-ssr https://raw.githubusercontent.com/Afdhan/esesha/main/renew-ssr.sh && chmod +x /usr/bin/renew-ssr
wget -O /usr/bin/add-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/add-sstp.sh && chmod +x /usr/bin/add-sstp
wget -O /usr/bin/del-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/del-sstp.sh && chmod +x /usr/bin/del-sstp
wget -O /usr/bin/cek-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/cek-sstp.sh && chmod +x /usr/bin/cek-sstp
wget -O /usr/bin/renew-sstp https://raw.githubusercontent.com/Afdhan/esesha/main/renew-sstp.sh && chmod +x /usr/bin/renew-sstp
echo "Done Patch"
rm -f patch.sh
