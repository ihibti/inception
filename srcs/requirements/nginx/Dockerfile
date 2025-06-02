FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    openssl nginx

COPY conf/ihibti.42.fr.conf /etc/nginx/sites-enabled

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY tools/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/entrypoint.sh 

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]
