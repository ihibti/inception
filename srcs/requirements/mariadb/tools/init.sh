#!/bin/bash
set -e

echo "🔧 Starting MariaDB to initialize database..."

# Start MySQL daemon in the background
mysqld_safe --datadir=/var/lib/mysql &

# Wait for the server to start
sleep 5

echo "📦 Creating database and user..."
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "🧼 Shutting down MariaDB after init..."
#echo "[mysqld]
#bind-address=0.0.0.0" > /etc/mysql/mariadb.conf.d/50-server.cnf
mysqladmin -u root shutdown
