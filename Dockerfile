FROM php:7.4-fpm
RUN apt install apt-transport-https ca-certificates && sed -i 's|deb.debian.org|mirrors.ustc.edu.cn|g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd