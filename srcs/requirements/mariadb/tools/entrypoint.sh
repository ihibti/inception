#!/bin/sh
set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# If database dir is empty → first time container runs
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    echo "📁 No DB found — running init script..."
    /usr/local/bin/init.sh
else
    echo "✅ Database already initialized."
fi

# Start MariaDB normally (as main process)
echo "🚀 Launching MariaDB..."
exec mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0
