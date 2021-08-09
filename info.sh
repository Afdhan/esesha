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
wsovpn=$(systemctl status ws-ovpn | grep -i "active (running)")

v2ray=$(systemctl status v2ray | grep -i "active (running)")
trojan=$(systemctl status trojan | grep -i "active (running)")
ipsec=$(systemctl status ipsec | grep -i "active (running)")
shadow=$(systemctl status shadowsocks-libev | grep -i "active (running)")
ssr=$(systemctl status ssrmu | grep -i "active (running)")
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
pptp=$(systemctl status pptpd | grep -i "active (running)")

ssh=$(systemctl status ssh | grep -i "active (running)")
ssl=$(systemctl status stunnel4 | grep -i "active (running)")
drop=$(systemctl status dropbear | grep -i "active (running)")
ovpn=$(systemctl status openvpn | grep -i "active (running)")
nginx=$(systemctl status nginx | grep -i "active (running)")
squid=$(systemctl status squid | grep -i "active (running)")
cron=$(systemctl status cron | grep -i "active (running)")
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")

#=================================================================================================

if [ ! -e $wsdrop ]; then
      swsdrop=$ERROR
else
      swsdrop=$AKTIF
fi

if [ ! -e $wstls ]; then
      swstls=$ERROR
else
      swstls=$AKTIF
fi

if [ ! -e $wsopen ]; then
      swsopen=$ERROR
else
      swsopen=$AKTIF
fi

if [ ! -e $wsovpn ]; then
      swsovpn=$ERROR
else
      swsovpn=$AKTIF
fi

if [ ! -e $v2ray ]; then
      sv2ray=$ERROR
else
      sv2ray=$AKTIF
fi

if [ ! -e $trojan ]; then
      strojan=$ERROR
else
      strojan=$AKTIF
fi

if [ ! -e $ipsec ]; then
      sipsec=$ERROR
else
      sipsec=$AKTIF
fi

if [ ! -e $shadow ]; then
      sshadow=$ERROR
else
      sshadow=$AKTIF
fi

if [ ! -e $ssr ]; then
      sssr=$ERROR
else
      sssr=$AKTIF
fi

if [ ! -e $sstp ]; then
      ssstp=$ERROR
else
      ssstp=$AKTIF
fi

if [ ! -e $l2tp ]; then
      sl2tp=$ERROR
else
      sl2tp=$AKTIF
fi

if [ ! -e $pptp ]; then
      spptp=$ERROR
else
      spptp=$AKTIF
fi

if [ ! -e $ssh ]; then
      sssh=$ERROR
else
      sssh=$AKTIF
fi

if [ ! -e $ssl ]; then
      sssl=$ERROR
else
      sssl=$AKTIF
fi

if [ ! -e $drop ]; then
      sdrop=$ERROR
else
      sdrop=$AKTIF
fi

if [ ! -e $ovpn ]; then
      sovpn=$ERROR
else
      sovpn=$AKTIF
fi

if [ ! -e $nginx ]; then
      snginx=$ERROR
else
      snginx=$AKTIF
fi

if [ ! -e $squid ]; then
      ssquid=$ERROR
else
      ssquid=$AKTIF
fi

if [ ! -e $cron ]; then
      scron=$ERROR
else
      scron=$AKTIF
fi

if [ ! -e $fail2ban ]; then
      sfail2ban=$ERROR
else
      sfail2ban=$AKTIF
fi

#=================================================================================================
clear
neofetch
cat /root/log-install.txt
echo -e "######################################################################" | lolcat
echo -e ""
echo -e "${cyan}===================================-[ SERVICES STATUS ]-=============================${off}"
echo -e "${green}"
echo -e "   - Dropbear                                    : $sdrop "
echo -e "   - OpenSSSH                                    : $sssh "
echo -e "   - Stunnel4                                    : $sssl "
echo -e "   - OpenVPN                                     : $sovpn "
echo -e "   - V2ray                                       : $sv2ray "
echo -e "   - Trojan                                      : $strojan "
echo -e "   - IPSec                                       : $sipsec "
echo -e "   - SSR                                         : $sssr "
echo -e "   - Shadowsocks                                 : $sshadow "
echo -e "   - SSTP                                        : $ssstp "
echo -e "   - PPTP                                        : $spptp "
echo -e "   - L2TP                                        : $sl2tp"
echo -e "   - WebSocket Dropbear                          : $swsdrop"
echo -e "   - WebSocket OpwnSSH                           : $swsopen"
echo -e "   - WebSocket TLS                               : $swstls"
echo -e "   - WebSocket OpenVPN                           : $swsovpn"
echo -e "   - Nginx                                       : $snginx "
echo -e "   - Squid                                       : $ssquid "
echo -e "   - Cron                                        : $scron "
echo -e "   - Fail2Ban                                    : $sfail2ban "
echo -e "${off}"
echo -e "${cyan}===================================-[ SERVICES STATUS ]-=============================${off}"
echo -e ""
