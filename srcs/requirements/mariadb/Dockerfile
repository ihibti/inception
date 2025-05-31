FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier les scripts
COPY ./tools/init.sh /usr/local/bin/init.sh
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Rendre les scripts exécutables
RUN chmod +x /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh /usr/local/bin/entrypoint.sh

# Point d'entrée
ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]

