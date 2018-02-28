FROM composer:latest as composer
FROM php:7.2-fpm-alpine

RUN apk --no-cache add \
    unzip \
    shadow \
    tzdata

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN mkdir /var/composer
ENV COMPOSER_HOME /var/composer
RUN chown -R www-data /var/composer

# Add access
RUN usermod -u 1000 www-data

RUN rm -rf /var/cache/apk/*
