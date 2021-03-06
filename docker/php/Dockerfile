FROM composer:latest as composer
FROM php:7.2-fpm-alpine

RUN apk add --no-cache --virtual persistent-deps \
        icu-libs \
        zlib \
        pcre-dev \
        shadow \
        tzdata

RUN apk add --no-cache --virtual \
        build-deps \
        $PHPIZE_DEPS \
        icu-dev \
        zlib-dev

RUN docker-php-ext-install \
        opcache \
        intl \
        zip

RUN pecl install \
        apcu \
        xdebug

RUN docker-php-ext-enable \
        opcache \
        apcu \
        xdebug

RUN apk del build-deps

# Add access
RUN usermod -u 1000 www-data

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN mkdir /var/composer
ENV COMPOSER_HOME /var/composer
RUN chown -R www-data /var/composer

RUN rm -rf /var/cache/apk/*
