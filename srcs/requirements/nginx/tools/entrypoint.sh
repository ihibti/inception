#!/bin/bash
set -e

# If certificates not found → first time container runs
if [ ! -f /etc/nginx/ssl/nginx.crt ] || [ ! -f /etc/nginx/ssl/nginx.key ]; then
    echo "📁 No certificate found — running init script..."
    /usr/local/bin/init.sh
else
    echo "✅ certificates already issued."
fi

# Start nginx (as main process)
echo "🚀 Launching nginx..."
chown -R www-data:www-data /var/www
chmod -R 775 /var/www 

exec nginx -g "daemon off;"

