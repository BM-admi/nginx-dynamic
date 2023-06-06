#!/bin/bash

env

_upstream_endpoint="${URL}"

generate_conf () {
  cat >/etc/nginx/conf.d/default.conf <<-EOF
server {
  listen 80;
  server_name localhost;
  server_tokens off;
  
  location / {
    proxy_pass $_upstream_endpoint;
    #proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
  }

  location /health-check {
    add_header Content-Type text/plain;
    return 200 "success";
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
