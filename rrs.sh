#!/bin/bash

systemctl daemon-reload
systemctl restart sslh
systemctl restart ws-dropbear
systemctl restart ws-stunnel
systemctl restart ws-openssh
systemctl restart ws-openvpn
systemctl restart v2ray
systemctl restart v2ray@none
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
systemctl restart trojan
systemctl restart ipsec
systemctl restart shadowsocks-libev
systemctl restart ssrmu
systemctl restart accel-ppp
systemctl restart xl2tpd
systemctl restart pptpd
systemctl restart wg-quick@wg0
systemctl restart ssh
systemctl restart stunnel4
systemctl restart dropbear
systemctl restart openvpn
systemctl restart nginx
systemctl restart squid
systemctl restart cron
systemctl restart fail2ban
systemctl restart vnstat
