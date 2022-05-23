#!/usr/bin/env bash

set -eu

SITE_NAME="My Wordpress Site"
SITE_URL="localhost"
PUBLIC_SITE_URL="yoursite.com"
SITE_PROJECT_NAME="yoursite_loc"
THEME_NAME="custom-theme"
PLUGIN_NAME="custom-plugin"

cp ./.templates/template.Makefile ../../Makefile
cp ./.templates/template.docker-compose.yml ../docker-compose.yml
cp ./.templates/template.wp_configure.sh ../build/cli/wp_configure.sh
cp ./.templates/template.devcontainer.json ../devcontainer.json
cp ./.templates/template.project.code-workspace ../build/workspace/project.code-workspace
cp ./.templates/template.root.env ../../.env
cp ./.templates/template.env ../.env
cp ./.templates/template.wordpress.conf ../build/nginx/conf.d/wordpress.conf
cp ./.templates/template.wordpress-ssl.conf ../build/nginx/conf.d/wordpress-ssl.conf
cp ./.templates/template.wordpress-ssl-file-proxy.conf ../build/nginx/conf.d/wordpress-ssl-file-proxy.conf

FILES="../../Makefile \
../docker-compose.yml \
../build/cli/wp_configure.sh \
../devcontainer.json \
../build/workspace/project.code-workspace \
../../.env \
../.env \
../build/nginx/conf.d/wordpress.conf \
../build/nginx/conf.d/wordpress-ssl.conf \
../build/nginx/conf.d/wordpress-ssl-file-proxy.conf"

sed -i '' "s/\<site-name\>/${SITE_NAME}/g" $FILES
sed -i '' "s/\<site-url\>/${SITE_URL}/g" $FILES
sed -i '' "s/\<public-site-url\>/${PUBLIC_SITE_URL}/g" $FILES
sed -i '' "s/\<site-project-name\>/${SITE_PROJECT_NAME}/g" $FILES
sed -i '' "s/\<theme-name\>/${THEME_NAME}/g" $FILES
sed -i '' "s/\<plugin-name\>/${PLUGIN_NAME}/g" $FILES