#!/bin/bash
set -e

echo "🔧 Starting MariaDB to initialize database..."

# Lancer le daemon MySQL en arrière-plan
mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0 &

sleep 5

echo "⏳ Waiting for MySQL to be ready for queries..."

# Attente active : ping toutes les secondes, jusqu'à 30 secondes max
# for i in {1..30}; do
#     if mysqladmin ping --silent; then
#         echo "✅ MySQL is ready."
#         break
#     fi
#     echo "⏳ mysqld not ready yet... (${i}/30)"
#     sleep 1
# done


echo "📦 Creating database and user..."
mysql -u root -h localhost <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "🧼 Shutting down MariaDB after init..."
mysqladmin -u root shutdown
