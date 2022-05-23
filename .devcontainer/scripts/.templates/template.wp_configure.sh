#!/usr/bin/env bash

set -eux

echo "[Running] Beginning WP Configuration"
wp --allow-root core install --url="http://<site-url>" --title="<site-name>" --admin_user="admin" --admin_email="admin@example.com" --admin_password="admin" --skip-email
wp --allow-root search-replace 'https://<public-site-url>' 'http://<site-url>' --all-tables

echo "Downloading plugins"
# wp --allow-root plugin install

echo "Downloading Parent theme"
# wp --allow-root theme install https://github.com/html5blank/html5blank/archive/stable.zip

echo "Placing Wordpress in Debug mode"
sed -i "s/'WP_DEBUG', false/'WP_DEBUG', true/" /var/www/html/wp-config.php
sed -i 's/display_errors = Off/display_errors = On/' /usr/local/etc/php/conf.d/error-logging.ini