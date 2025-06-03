FROM debian:bullseye

# 1. Mettre à jour les paquets et installer PHP
RUN apt-get update && apt-get install -y \
    php \
    wget \
    unzip \
    && apt-get clean

# 2. Créer un répertoire web et y télécharger Adminer
RUN mkdir -p /var/www/html && \
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/index.php

# 3. Exposer le port interne utilisé par PHP
EXPOSE 8080

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash","entrypoint.sh"]
