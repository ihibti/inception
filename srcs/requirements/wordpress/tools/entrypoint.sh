#!/bin/sh
set -e

cd /var/www/html

# ✅ Télécharger WordPress si manquant
if [ ! -f "wp-load.php" ]; then
    echo "⬇️  Downloading WordPress..."
    wp core download --allow-root
fi

# ⚙️ Installer WordPress si pas déjà installé
if ! wp core is-installed --allow-root; then
    echo "🛠️  Setting up WordPress..."

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$MYSQL_HOST" \
        --allow-root

    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
else
    echo "✅ WordPress already installed."
fi

echo "🚀 Starting php-fpm..."
exec php-fpm -F
