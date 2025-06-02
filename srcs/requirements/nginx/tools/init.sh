#!/bin/bash

set -e

echo "Creating necessary directories"

mkdir -p /etc/nginx/ssl
mkdir -p /var/log/nginx



if [ ! -f /etc/nginx/ssl/nginx.crt ] || [ ! -f /etc/nginx/ssl/nginx.key ]; then
    echo "Generating self-signed TLS certificate..."
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=Student/CN=ihibti.42.fr"
else
    echo "✅ TLS certificate already exists."
fi

exec nginx -g "daemon off;"
