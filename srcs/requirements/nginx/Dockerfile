FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup_ssl.sh /usr/local/bin/setup_ssl.sh

RUN chmod +x /usr/local/bin/setup_ssl.sh

# Create SSL directory
RUN mkdir -p /etc/ssl/certs /etc/ssl/private

# Create nginx user directories
RUN mkdir -p /var/cache/nginx /var/log/nginx /var/lib/nginx && \
    chown -R www-data:www-data /var/cache/nginx /var/log/nginx /var/lib/nginx

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/setup_ssl.sh"]