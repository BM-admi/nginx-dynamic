#!/bin/bash

generate_conf () {
  cat >/etc/nginx/conf.d/default.conf <<-EOF
server {
  listen 80;
  listen  [::]:80;
  
  server_name localhost;
  server_tokens off;

  location / {
    proxy_pass http://192.168.206.105:80; #### FIXME
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
  }
}
EOF
}

while true
do
  generate_conf
  nginx -s reload
  sleep 3600
done
