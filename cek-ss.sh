#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "${red}============================${NC}";
echo "     SS OBFS USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
echo ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo -e "${red}============================${NC}";
echo "         USER | TLS"
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo -e "${red}============================${NC}";
fi
x=$(( "$x" + 1 ))
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo ""
echo -e "${red}============================${NC}";
echo "         USER |  HTTP"
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo -e "${red}============================${NC}";
fi
x=$(( "$x" + 1 ))
done
