FROM php:7.3.18-zts-alpine3.11

RUN docker-php-ext-install pdo pdo_mysql
