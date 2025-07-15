#!/bin/bash

set -e

echo "Starting MariaDB initialization..."

# Start MySQL temporarily to set up databases
mysqld_safe --datadir=/var/lib/mysql --user=mysql &
MYSQL_PID=$!

# Wait for MySQL to start
while ! mysqladmin ping --silent; do
    echo "Waiting for MySQL to start..."
    sleep 1
done

echo "MySQL started, configuring databases..."

# Secure the installation and create databases (updated for newer MariaDB)
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

# Create WordPress database and user
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "Database configuration completed!"

# Stop the temporary MySQL instance
mysqladmin shutdown -p${MYSQL_ROOT_PASSWORD}
wait $MYSQL_PID

echo "Starting MariaDB server..."
exec mysqld_safe --datadir=/var/lib/mysql --user=mysql
