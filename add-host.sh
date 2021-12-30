#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

read -rp "Masukkan Domain Anda : " -e host
sleep 1
  echo -e "${green}Pastikan Domain Anda Sudah DiPointing Sebelumnya!${off}"
sleep 1
ptrg="$(cat ~/log-install.txt | grep -i TrojanGO | cut -d: -f2|sed 's/ //g')"
uuid=$(cat /etc/trojan-go/uuid.txt)
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
cat <<EOF > /etc/trojan-go/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": $ptrg,
    "remote_addr": "127.0.0.1",
    "remote_port": 81,
    "log_level": 1,
    "log_file": "/var/log/trojan-go.log",
    "password": [
        "$uuid"
    ],
  "disable_http_check": false,
  "udp_timeout": 60,
  "ssl": {
    "verify": true,
    "verify_hostname": true,
    "cert": "/etc/v2ray/v2ray.crt",
    "key": "/etc/v2ray/v2ray.key",
    "key_password": "",
    "cipher": "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
    "curves": "",
    "prefer_server_cipher": true,
    "sni": "$host",
    "alpn": [
      "http/1.1"
    ],
    "session_ticket": true,
    "reuse_session": true,
    "plain_http_response": "",
    "fallback_addr": "127.0.0.1",
    "fallback_port": $ptrg,
    "fingerprint": ""
  },
  "tcp": {
    "no_delay": true,
    "keep_alive": true,
    "prefer_ipv4": false
  },
  "mux": {
    "enabled": true,
    "concurrency": 64,
    "idle_timeout": 60
  },
  "router": {
    "enabled": true,
    "bypass": [],
    "proxy": [],
    "block": [],
    "default_policy": "proxy",
    "domain_strategy": "as_is",
    "geoip": "/etc/trojan-go/geoip.dat",
    "geosite": "/etc/trojan-go/geosite.dat"
  },
  "websocket": {
    "enabled": true,
    "path": "/DhanZaa",
    "host": "$host"
  },
  "shadowsocks": {
    "enabled": false,
    "method": "AES-128-GCM",
    "password": ""
  },
  "transport_plugin": {
    "enabled": false,
    "type": "",
    "command": "",
    "plugin_option": "",
    "arg": [],
    "env": []
  },
  "forward_proxy": {
    "enabled": false,
    "proxy_addr": "",
    "proxy_port": 0,
    "username": "",
    "password": ""
  },
  "mysql": {
    "enabled": false,
    "server_addr": "localhost",
    "server_port": 3306,
    "database": "",
    "username": "",
    "password": "",
    "check_rate": 60
  },
  "api": {
    "enabled": false,
    "api_addr": "",
    "api_port": 0,
    "ssl": {
      "enabled": false,
      "key": "",
      "cert": "",
      "verify_client": false,
      "client_cert": []
    }
  }
}
EOF

cat > /etc/nginx/sites-enabled/wildcard_subdomain << END
server {
    server_name *.${host};
    access_log /var/log/nginx/vps-access.log;
    error_log /var/log/nginx/vps-error.log error;
    root /home/vps/public_html;
    
    location / {
       index  index.html index.htm index.php;
       try_files $uri $uri/ /index.php?$args;
    }
    location ~\.php$ {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass  127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
    location ~ /\.ht {
        deny all;
    }
    location ~* /(?:uploads|files)/.*\.php$ {
        deny all;
    }
    location ~* \.(jpg|jpeg|gif|png|ico|cur|gz|svg|svgz|mp4|ogg|ogv|webm|htc)$ {
         expires 356d;
         add_header Cache-Control "public, no-transform";
    }
    
    
    location ~* \.(css|js)$ {
         expires 2d;
         add_header Cache-Control "public, no-transform";
    }
    listen: 81;
}
END

 systemctl daemon-reload
 systemctl restart nginx
echo "Berhasil Menambahkan Domain VPS" | lolcat
figlet -f slant AFDHAN - NEZA | lolcat

read -p "Perbarui Sertifikat V2ray? (Y/N) : " up
if [[ $up == "Y" || $up == "y" ]]; then
certv2ray
else echo ""
fi
