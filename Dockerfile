FROM php:7.3.18-apache

RUN docker-php-ext-install pdo pdo_mysql

# Laravel requirements
RUN a2enmod rewrite
COPY --chown=www-data:www-data ./src /var/www/web