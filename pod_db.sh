#!/usr/bin/env bash

mkdir -P /home/pien/pod/db0/mariadb0
mkdir /home/pien/pod/db0/phpmyadmin0

podman pod create \
 --publish 8080:80 \
 --publish 3306:3306 \
 db0

podman run --name mariadb0 \
 --pod db0 \
 -v /home/pien/pod/db0/mariadb0:/var/lib/mysql:Z \
 -e MYSQL_ROOT_PASSWORD="" \
 -e MYSQL_USER=pien \
 -e MYSQL_PASSWORD="" \
 -d docker.io/library/mariadb

podman run --name phpmyadmin0 \
 --pod db0 \
 -d \
 -v /home/pien/pod/db0/phpmyadmin0:/etc/phpmyadmin/config.user.inc.php:Z \
 -e PMA_HOST=127.0.0.1 \
 -e PMA_PORT=3306 \
 phpmyadmin
