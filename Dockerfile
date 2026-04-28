FROM php:8.3-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        imagemagick \
        ffmpeg \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd exif \
    && rm -rf /var/lib/apt/lists/*
