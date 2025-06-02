FROM php:8.2-apache

# Instala extensões necessárias: mysqli e pdo_mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo pdo_mysql

# Copia configurações customizadas de PHP (se você tiver esse arquivo)
COPY config/php.ini /usr/local/etc/php/

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

# Copia os arquivos do Ocomon para o diretório do Apache
COPY ./ocomon /var/www/html

# Ajusta permissões para o Apache conseguir acessar os arquivos
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

WORKDIR /var/www/html

