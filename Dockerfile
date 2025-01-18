FROM php:8.3.15-apache

ENV APACHE_DOCUMENT_ROOT=/app/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
    a2enmod rewrite

RUN apt-get update && \
    apt-get install -y git libfreetype-dev libjpeg62-turbo-dev libpng-dev unzip zlib1g-dev && \
    apt-get clean && \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd exif pdo pdo_mysql && \
    docker-php-source delete

ADD --chmod=775 https://getcomposer.org/download/2.8.4/composer.phar /usr/local/bin/composer

RUN mkdir /app && chown 53:53 /app

# www-data
USER 53:53

WORKDIR /app

ADD --chown=53:53 https://github.com/flarum/installation-packages/raw/main/packages/v1.x/flarum-v1.x-php8.3.tar.gz flarum.tar.gz

RUN tar -xf flarum.tar.gz && rm flarum.tar.gz

RUN composer require \
  flarum-lang/russian \
  fof/upload \
  fof/nightmode \
  fof/linguist

COPY --chown=53:53 config.docker.php flarum-run ./

CMD ["/app/flarum-run"]
