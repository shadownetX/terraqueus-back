FROM php:7.2-fpm-alpine

MAINTAINER Thomas THIEBAUDET <thomas@thiebaudet.fr>

RUN apk --no-cache add \
    unzip \
    shadow

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

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"

# Add custom php.ini
ADD php.ini /usr/local/etc/php

# Add access
RUN usermod -u 1000 www-data

WORKDIR /var/www/symfony-back
