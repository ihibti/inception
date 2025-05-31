FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    openssl nginx

COPY conf/ihibti.42.fr.conf /etc/nginx/sites-enabled

ENTRYPOINT ["nginx","-g","daemon off;" ]

