FROM php:8.3-fpm-alpine

LABEL authors="Saddan Faruk Omar (saddanfah@gmail.com)"

# 1. Install Node.js and NPM from official image
# Using Node 20 to match your previous setup
COPY --from=node:20-alpine /usr/lib /usr/lib
COPY --from=node:20-alpine /usr/local/share /usr/local/share
COPY --from=node:20-alpine /usr/local/lib /usr/local/lib
COPY --from=node:20-alpine /usr/local/bin /usr/local/bin

# Install required PHP extensions for Laravel
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    bcmath \
    pcntl

# Zip support and build essentials for some npm packages
RUN apk add --no-cache libzip-dev git \
    && docker-php-ext-install zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Create non-root user
RUN addgroup -g 1000 melo_dramatic \
    && adduser -G melo_dramatic -u 1000 -s /bin/sh -D melo_dramatic

# Ensure permissions are correct before switching users
RUN chown -R melo_dramatic:melo_dramatic /var/www/html

USER melo_dramatic