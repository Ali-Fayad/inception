FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-xmlrpc \
    php8.2-soap \
    php8.2-intl \
    php8.2-zip \
    curl \
    wget \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Download and install WP-CLI (using the official stable release)
RUN wget https://github.com/wp-cli/wp-cli/releases/download/v2.11.0/wp-cli-2.11.0.phar -O wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Configure PHP-FPM
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Create WordPress directory
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Copy setup script
COPY tools/setup_wp.sh /usr/local/bin/setup_wp.sh
RUN chmod +x /usr/local/bin/setup_wp.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/setup_wp.sh"]
