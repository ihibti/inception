FROM debian:bullseye


RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl unzip wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*