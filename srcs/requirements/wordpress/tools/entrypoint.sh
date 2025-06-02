#!/bin/sh
set -e

cd /var/www/html

chown -R www-data:www-data /var/www
chmod -R 775 /var/www 

# ✅ Télécharger WordPress si manquant
if [ ! -f "wp-load.php" ]; then
    echo "⬇️  Downloading WordPress..."
    sudo -u wordpress -i --  wp core download --path=/var/www/html/ 
fi

# ⚙️ Installer WordPress si pas déjà installé
if ! sudo -u wordpress -i -- wp core is-installed --path=/var/www/html/ ; then
    echo "🛠️  Setting up WordPress..."

    sudo -u wordpress -i -- wp config create --path=/var/www/html/ \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$MYSQL_HOST" 

    sudo -u wordpress -i -- wp core install --path=/var/www/html/ \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email 
    
else
    echo "✅ WordPress already installed."
fi

echo "🚀 Starting php-fpm..."
exec php-fpm7.4 -F
