FROM php:7.2-fpm-alpine

RUN apk --no-cache add \
    unzip \
    shadow \
    tzdata

# Install Composer and fix flex permissions to https---symfony.sh
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
RUN mkdir -p /var/www/.composer/cache/repo/https---packagist.org/ \
             /var/www/.composer/cache/repo/https---symfony.sh/ \
             /var/www/.composer/cache/files/
RUN chown -R www-data:www-data \
        /var/www/.composer/cache/repo/https---packagist.org/ \
        /var/www/.composer/cache/repo/https---symfony.sh/ \
        /var/www/.composer/cache/files/

# Add access
RUN usermod -u 1000 www-data

RUN rm -rf /var/cache/apk/*
