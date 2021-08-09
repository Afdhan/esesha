#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

AKTIF="${green}Aktif [Running]${NC}"
ERROR="${red}Error [Not Running]${NC}"

#=================================================================================================

wsdrop=$(systemctl status ws-dropbear | grep -i "active (running)")
wstls=$(systemctl status ws-stunnel | grep -i "active (running)")
wsopen=$(systemctl status ws-openssh | grep -i "active (running)")
wsovpn=$(systemctl status ws-openvpn | grep -i "active (running)")

v2ray=$(systemctl status v2ray | grep -i "active (running)")
v2none=$(systemctl status v2ray@none | grep -i "active (running)")
vless=$(systemctl status v2ray@vless | grep -i "active (running)")
vnone=$(systemctl status v2ray@vnone | grep -i "active (running)")
trojan=$(systemctl status trojan | grep -i "active (running)")
ipsec=$(systemctl status ipsec | grep -i "active (running)")
shadow=$(systemctl status shadowsocks-libev | grep -i "active (running)")
ssr=$(systemctl status ssrmu | grep -i "active (running)")
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
pptp=$(systemctl status pptpd | grep -i "active (running)")
wg=$(systemctl status wg-quick@wg0 | grep -i "active (exited)")

ssh=$(systemctl status ssh | grep -i "active (running)")
ssl=$(systemctl status stunnel4 | grep -i "active (running)")
drop=$(systemctl status dropbear | grep -i "active (running)")
ovpn=$(systemctl status openvpn | grep -i "active (exited)")
nginx=$(systemctl status nginx | grep -i "active (running)")
squid=$(systemctl status squid | grep -i "active (running)")
cron=$(systemctl status cron | grep -i "active (running)")
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
vnstat=$(systemctl status vnstat | grep -i "active (running)")

#=================================================================================================

if [[ $wsdrop == "" ]]; then
      swsdrop=$ERROR
else
      swsdrop=$AKTIF
fi

if [[ $wstls == "" ]]; then
      swstls=$ERROR
else
      swstls=$AKTIF
fi

if [[ $wsopen == "" ]]; then
      swsopen=$ERROR
else
      swsopen=$AKTIF
fi

if [[ $wsovpn == "" ]]; then
      swsovpn=$ERROR
else
      swsovpn=$AKTIF
fi

if [[ $v2ray == "" ]]; then
      sv2ray=$ERROR
else
      sv2ray=$AKTIF
fi

if [[ $v2none == "" ]]; then
      sv2none=$ERROR
else
      sv2none=$AKTIF
fi

if [[ $vless == "" ]]; then
      svless=$ERROR
else
      svless=$AKTIF
fi

if [[ $vnone == "" ]]; then
      svnone=$ERROR
else
      svnone=$AKTIF
fi

if [[ $trojan == "" ]]; then
      strojan=$ERROR
else
      strojan=$AKTIF
fi

if [[ $ipsec == "" ]]; then
      sipsec=$ERROR
else
      sipsec=$AKTIF
fi

if [[ $shadow == "" ]]; then
      sshadow=$ERROR
else
      sshadow=$AKTIF
fi

if [[ $ssr == "" ]]; then
      sssr=$ERROR
else
      sssr=$AKTIF
fi

if [[ $sstp == "" ]]; then
      ssstp=$ERROR
else
      ssstp=$AKTIF
fi

if [[ $l2tp == "" ]]; then
      sl2tp=$ERROR
else
      sl2tp=$AKTIF
fi

if [[ $pptp == "" ]]; then
      spptp=$ERROR
else
      spptp=$AKTIF
fi

if [[ $wg == "" ]]; then
      swg=$ERROR
else
      swg=$AKTIF
fi

if [[ $ssh == "" ]]; then
      sssh=$ERROR
else
      sssh=$AKTIF
fi

if [[ $ssl == "" ]]; then
      sssl=$ERROR
else
      sssl=$AKTIF
fi

if [[ $drop == "" ]]; then
      sdrop=$ERROR
else
      sdrop=$AKTIF
fi

if [[ $ovpn == "" ]]; then
      sovpn=$ERROR
else
      sovpn=$AKTIF
fi

if [[ $nginx == "" ]]; then
      snginx=$ERROR
else
      snginx=$AKTIF
fi

if [[ $squid == "" ]]; then
      ssquid=$ERROR
else
      ssquid=$AKTIF
fi

if [[ $cron == "" ]]; then
      scron=$ERROR
else
      scron=$AKTIF
fi

if [[ $fail2ban == "" ]]; then
      sfail2ban=$ERROR
else
      sfail2ban=$AKTIF
fi

if [[ $vnstat == "" ]]; then
      svnstat=$ERROR
else
      svnstat=$AKTIF
fi

#=================================================================================================
clear
neofetch
cat /root/log-install.txt
echo -e "###################################################################################" | lolcat
echo -e ""
echo -e "${cyan}==================================-[ SERVICES STATUS ]-=============================${off}"
echo -e ""
echo -e "   - Dropbear                              : $sdrop "
echo -e "   - OpenSSH                               : $sssh "
echo -e "   - Stunnel4                              : $sssl "
echo -e "   - OpenVPN                               : $sovpn "
echo -e "   - VMess TLS                             : $sv2ray "
echo -e "   - VMess NON-TLS                         : $sv2none "
echo -e "   - VLess TLS                             : $svless "
echo -e "   - VLess NON-TLS                         : $svnone "
echo -e "   - Trojan                                : $strojan "
echo -e "   - IPSec                                 : $sipsec "
echo -e "   - SSR                                   : $sssr "
echo -e "   - Shadowsocks                           : $sshadow "
echo -e "   - SSTP                                  : $ssstp "
echo -e "   - PPTP                                  : $spptp "
echo -e "   - L2TP                                  : $sl2tp"
echo -e "   - Wireguard                             : $swg "
echo -e "   - WebSocket Dropbear                    : $swsdrop"
echo -e "   - WebSocket OpenSSH                     : $swsopen"
echo -e "   - WebSocket TLS                         : $swstls"
echo -e "   - WebSocket OpenVPN                     : $swsovpn"
echo -e "   - Nginx                                 : $snginx "
echo -e "   - Squid                                 : $ssquid "
echo -e "   - Cron                                  : $scron "
echo -e "   - Fail2Ban                              : $sfail2ban "
echo -e "   - VnStat                                : $svnstat "
echo -e ""
echo -e "${cyan}==================================-[ SERVICES STATUS ]-=============================${off}"
echo -e ""
echo -e "${green}Dalam Project Ini, Kami Tidak Bertanggung Jawab Jika Terjadi Kesalahan Pada Saat Anda Merubah Pengaturan System!${off}"
echo -e "${green}Baik Itu Tampilan Menu, Banner SSH, Port VPN, Ataupun Yang Lainnya.${off}"
echo -e ""
