#!/bin/bash

set -e

echo "Setting up SSL certificates..."

# Generate self-signed SSL certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=${SSL_COUNTRY}/ST=${SSL_STATE}/L=${SSL_CITY}/O=${SSL_ORG}/OU=${SSL_UNIT}/CN=${DOMAIN_NAME}/emailAddress=${SSL_EMAIL}"

echo "SSL certificates generated!"

# Set proper permissions
chmod 600 /etc/ssl/private/nginx-selfsigned.key
chmod 644 /etc/ssl/certs/nginx-selfsigned.crt

echo "Starting NGINX..."
exec nginx -g "daemon off;"