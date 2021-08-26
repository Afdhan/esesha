#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

AKTIF="Aktif [ ${green}Running${NC} ]"
ERROR="Error [ ${red}Not Running${NC} ]"

dahlah=()
mantap=()
declare ingfo=()


             
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
trojang=$(systemctl status trojan-go | grep -i "active (running)")
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
      ingfo+=("WebSocket Dropbear")
      dahlah+=("err1")
else
      swsdrop=$AKTIF
      mantap+=("hore1")
fi

if [[ $wstls == "" ]]; then
      swstls=$ERROR
      ingfo+=("WebSocket TLS")
      dahlah+=("err2")
else
      swstls=$AKTIF
      mantap+=("hore2")
fi

if [[ $wsopen == "" ]]; then
      swsopen=$ERROR
      ingfo+=("WebSocket OpenSSH")
      dahlah+=("err3")
else
      swsopen=$AKTIF
      mantap+=("hore3")
fi

if [[ $wsovpn == "" ]]; then
      swsovpn=$ERROR
      ingfo+=("WebSocket OpenVPN")
      dahlah+=("err4")
else
      swsovpn=$AKTIF
      mantap+=("hore4")
fi

if [[ $v2ray == "" ]]; then
      sv2ray=$ERROR
      ingfo+=("V2ray/VMess TLS")
      dahlah+=("err5")
else
      sv2ray=$AKTIF
      mantap+=("hore5")
fi

if [[ $v2none == "" ]]; then
      sv2none=$ERROR
      ingfo+=("V2ray/VMess NON-TLS")
      dahlah+=("err6")
else
      sv2none=$AKTIF
      mantap+=("hore6")
fi

if [[ $vless == "" ]]; then
      svless=$ERROR
      ingfo+=("V2ray/VLess TLS")
      dahlah+=("err7")
else
      svless=$AKTIF
      mantap+=("hore7")
fi

if [[ $vnone == "" ]]; then
      svnone=$ERROR
      ingfo+=("V2ray/VLess NON-TLS")
      dahlah+=("err8")
else
      svnone=$AKTIF
      mantap+=("hore8")
fi

if [[ $trojan == "" ]]; then
      strojan=$ERROR
      ingfo+=("TrojanGFW")
      dahlah+=("err9")
else
      strojan=$AKTIF
      mantap+=("hore9")
fi

if [[ $trojang == "" ]]; then
      strojang=$ERROR
      ingfo+=("TrojanGO")
      dahlah+=("erre")
else
      strojang=$AKTIF
      mantap+=("horee")
fi

if [[ $ipsec == "" ]]; then
      sipsec=$ERROR
      ingfo+=("IPSec Services")
      dahlah+=("err10")
else
      sipsec=$AKTIF
      mantap+=("hore10")
fi

if [[ $shadow == "" ]]; then
      sshadow=$ERROR
      ingfo+=("Shadowsocks OBFS")
      dahlah+=("err11")
else
      sshadow=$AKTIF
      mantap+=("hore11")
fi

if [[ $ssr == "" ]]; then
      sssr=$ERROR
      ingfo+=("ShadowsocksR/SSR")
      dahlah+=("err12")
else
      sssr=$AKTIF
      mantap+=("hore12")
fi

if [[ $sstp == "" ]]; then
      ssstp=$ERROR
      ingfo+=("SSTP")
      dahlah+=("err13")
else
      ssstp=$AKTIF
      mantap+=("hore13")
fi

if [[ $l2tp == "" ]]; then
      sl2tp=$ERROR
      ingfo+=("L2TP")
      dahlah+=("err14")
else
      sl2tp=$AKTIF
      mantap+=("hore14")
fi

if [[ $pptp == "" ]]; then
      spptp=$ERROR
      ingfo+=("PPTP")
      dahlah+=("err15")
else
      spptp=$AKTIF
      mantap+=("hore15")
fi

if [[ $wg == "" ]]; then
      swg=$ERROR
      ingfo+=("Wireguard")
      dahlah+=("err16")
else
      swg=$AKTIF
      mantap+=("hore16")
fi

if [[ $ssh == "" ]]; then
      sssh=$ERROR
      ingfo+=("OpenSSH")
      dahlah+=("err17")
else
      sssh=$AKTIF
      mantap+=("hore17")
fi

if [[ $ssl == "" ]]; then
      sssl=$ERROR
      ingfo+=("Stunnel4")
      dahlah+=("err18")
else
      sssl=$AKTIF
      mantap+=("hore18")
fi

if [[ $drop == "" ]]; then
      sdrop=$ERROR
      ingfo+=("Dropbear")
      dahlah+=("err19")
else
      sdrop=$AKTIF
      mantap+=("hore19")
fi

if [[ $ovpn == "" ]]; then
      sovpn=$ERROR
      ingfo+=("OpenVPN")
      dahlah+=("err20")
else
      sovpn=$AKTIF
      mantap+=("hore20")
fi

if [[ $nginx == "" ]]; then
      snginx=$ERROR
      ingfo+=("Nginx")
      dahlah+=("err21")
else
      snginx=$AKTIF
      mantap+=("hore21")
fi

if [[ $squid == "" ]]; then
      ssquid=$ERROR
      ingfo+=("Squid")
      dahlah+=("err22")
else
      ssquid=$AKTIF
      mantap+=("hore22")
fi

if [[ $cron == "" ]]; then
      scron=$ERROR
      ingfo+=("Cron Services")
      dahlah+=("err23")
else
      scron=$AKTIF
      mantap+=("hore23")
fi

if [[ $fail2ban == "" ]]; then
      sfail2ban=$ERROR
      ingfo+=("Fail2Ban Services")
      dahlah+=("err24")
else
      sfail2ban=$AKTIF
      mantap+=("hore24")
fi

if [[ $vnstat == "" ]]; then
      svnstat=$ERROR
      ingfo+=("VnStats Services")
      dahlah+=("err25")
else
      svnstat=$AKTIF
      mantap+=("hore25")
fi



jumlah1="${#mantap[@]}"
jumlah2="${#dahlah[@]}"

if [[ $jumlah1 == "" ]] || [[ $jumlah1 -eq 0 ]]; then
     jumlah_aktif=0
else
     let njor=${jumlah1}
     jumlah_aktif=$njor
fi

if [[ $jumlah2 == "" ]] || [[ $jumlah2 -eq 0 ]]; then
    jumlah_error=0
else
    let njir=${jumlah2}
    jumlah_error=$njir
fi

#=================================================================================================
clear

#echo -e "###################################################################################" | lolcat
echo -e ""
echo -e "${cyan}==================================-[ SERVICES STATUS ]-=============================${off}"
echo -e ""
echo -e "   - Dropbear                              : $sdrop "
echo -e "   - OpenSSH                               : $sssh "
echo -e "   - Stunnel4                              : $sssl "
echo -e "   - OpenVPN                               : $sovpn "
echo -e "   - WebSocket Dropbear                    : $swsdrop"
echo -e "   - WebSocket OpenSSH                     : $swsopen"
echo -e "   - WebSocket OpenVPN                     : $swsovpn"
echo -e "   - WebSocket TLS                         : $swstls"
echo -e "   - VMess TLS                             : $sv2ray "
echo -e "   - VMess NON-TLS                         : $sv2none "
echo -e "   - VLess TLS                             : $svless "
echo -e "   - VLess NON-TLS                         : $svnone "
echo -e "   - Shadowsocks                           : $sshadow "
echo -e "   - Wireguard                             : $swg "
echo -e "   - TrojanGFW                             : $strojan "
echo -e "   - TrojanGO                              : $strojang "
echo -e "   - IPSec                                 : $sipsec "
echo -e "   - SSR                                   : $sssr "
echo -e "   - SSTP                                  : $ssstp "
echo -e "   - PPTP                                  : $spptp "
echo -e "   - L2TP                                  : $sl2tp"
echo -e "   - Nginx                                 : $snginx "
echo -e "   - Squid                                 : $ssquid "
echo -e "   - Cron                                  : $scron "
echo -e "   - Fail2Ban                              : $sfail2ban "
echo -e "   - VnStats                               : $svnstat "
echo -e ""
echo -e "${cyan}==================================-[ SERVICES STATUS ]-=============================${off}"
echo -e ""
echo -e "  - Jumlah Services Running [ ${green}$jumlah_aktif${off} ]"
echo -e "  - Jumlah Services Error [ ${red}$jumlah_error${off} ]"

if [[ "${ingfo[@]}" != "" ]]; then
      echo -e ""
      echo -e "  ${red} !!! Peringatan !!!${off}"
for oo in "${ingfo[@]}"
  do
       echo -e "  - [${red} ${oo} ${off}] ${red}Error !!!${off}"
done
echo -e ""
min=0
sec=30
                while [ $min -ge 0 ]; do
                        while [ $sec -ge 0 ]; do
                                echo -ne " [#]  ${cyan}Auto Restart Services Dalam${off} [${green} $min:$sec ${off}]\033[0K\r"
                                 let "sec=sec-1"
                                 sleep 1
            done
            sec=59
            let "min=min-1"            
      done      
         echo -e " \n${green} Merestart Services... ${off}"
         sleep 1
                systemctl restart ws-dropbear
                systemctl restart ws-openssh
                systemctl restart ws-openvpn
                systemctl restart ws-stunnel
                systemctl restart v2ray
                systemctl restart v2ray@none
                systemctl restart v2ray@vless
                systemctl restart v2ray@vnone
                systemctl restart trojan
                systemctl restart ssh
                systemctl restart ssrmu
                systemctl restart stunnel4
                systemctl restart openvpn
                systemctl restart dropbear
                systemctl restart ws-dropbear
                systemctl restart ws-openssh
                systemctl restart ws-openvpn
                systemctl restart ws-stunnel
                systemctl restart v2ray
                systemctl restart v2ray@none
                systemctl restart v2ray@vless
                systemctl restart v2ray@vnone
                systemctl restart trojan
                systemctl restart trojan-go
                systemctl restart ssh
                systemctl restart ssrmu
                systemctl restart stunnel4
                systemctl restart openvpn
                systemctl restart dropbear
fi
echo ""
echo -e "${cyan}====================================================================================${off}"
echo -e " - Mod By Dhansss X NezaVPN" | lolcat
echo -e ""
