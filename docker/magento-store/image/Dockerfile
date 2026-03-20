FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libxml2-dev \
    libxslt1-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    zip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo_mysql \
        intl \
        zip \
        xsl \
        soap \
        bcmath \
        gd \
        opcache \
        sockets \
        ftp

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer


RUN sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /usr/local/etc/php-fpm.d/www.conf


RUN echo "memory_limit=2G" > /usr/local/etc/php/conf.d/memory.ini \
 && echo "max_execution_time=1800" >> /usr/local/etc/php/conf.d/memory.ini

WORKDIR /var/www/magento

CMD ["php-fpm"]