FROM php:7.3.18-apache

RUN docker-php-ext-install pdo pdo_mysql

# Laravel requirements
RUN a2enmod rewrite
# test
COPY --chown=www-data:www-data ./src /var/www/web
# RUN chown -R www-data:www-data /var/www/web
# RUN chmod -R ug+rwx storage /var/www/web/bootstrap/cache
RUN chmod -R 777 /var/www/web/storage/logs