#!/bin/bash
set -e

echo "🔧 Starting MariaDB to initialize database..."

# Lancer le daemon MySQL en arrière-plan
mysqld_safe --datadir=/var/lib/mysql &

sleep 10

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

# Test de connexion explicite (affiche les bases ou échoue)
echo "🔍 Testing connection with root..."
if ! mysql -u root -e "SHOW DATABASES;"; then
    echo "❌ MySQL not responding — dumping logs:"
    cat /var/log/mysql/error.log || true
    exit 1
fi

echo "📦 Creating database and user..."
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "🧼 Shutting down MariaDB after init..."
mysqladmin -u root shutdown
