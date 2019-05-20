FROM php:7.2-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libpng-dev

RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo pdo_mysql

COPY ./installer-*.sh /root/

RUN chmod +x /root/installer-*.sh

# Prepare webroot and download installer
RUN /root/installer-download.sh && \
  chmod -R 777 .
