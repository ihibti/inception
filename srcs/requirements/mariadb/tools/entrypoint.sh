#!/bin/bash
set -e

# If database dir is empty → first time container runs
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "📁 No DB found — running init script..."
    /usr/local/bin/init.sh
else
    echo "✅ Database already initialized."
fi

# Start MariaDB normally (as main process)
echo "🚀 Launching MariaDB..."
exec mysqld_safe --datadir=/var/lib/mysql
