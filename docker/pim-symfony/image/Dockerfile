FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev \
    && docker-php-ext-install pdo_mysql zip

WORKDIR /var/www/pim