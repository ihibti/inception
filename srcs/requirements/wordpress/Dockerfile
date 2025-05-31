FROM debian:bullseye

# Install dependencies: PHP, extensions, WP-CLI, and tools
RUN apt-get update && apt-get install -y \
    php\
    sudo\
    php-fpm \
    php-mysql \
    curl \
    mariadb-client \
    less \
    unzip \
    wget \
    netcat\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy config and setup files
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
COPY conf/wordpress.pool.conf /etc/php/7.4/fpm/pool.d/

# Set working directory
WORKDIR /var/www/html

RUN mkdir -p /run/php

RUN touch /run/php/php7.4-fpm.sock

RUN groupadd wordpress

RUN useradd -m -g  wordpress wordpress

RUN usermod -aG www-data wordpress

# Run the custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
