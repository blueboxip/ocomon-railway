FROM php:8.2-apache

# Instala extensões necessárias: mysqli e pdo_mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo pdo_mysql

# Copia configurações customizadas de PHP
COPY config/php.ini /usr/local/etc/php/

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

WORKDIR /var/www/html
