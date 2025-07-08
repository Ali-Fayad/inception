FROM debian:bookworm

RUN apt update && \
    apt install -y wget php php-fpm php-mysql php-curl php-json php-gd php-mbstring php-xml php-zip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

COPY ./tools/wp-config.php /var/www/html/wp-config.php

CMD ["php-fpm8.2", "-F"]

