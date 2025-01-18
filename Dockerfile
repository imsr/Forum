FROM dunglas/frankenphp:1.4-php8.4-alpine

ENV SERVER_NAME=:80

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    install-php-extensions \
    gd \
    exif \
    pdo \
    pdo_mysql

ADD --chmod=775 https://getcomposer.org/download/2.8.4/composer.phar /usr/local/bin/composer

ADD https://github.com/flarum/installation-packages/raw/main/packages/v1.x/flarum-v1.x-php8.3.tar.gz flarum.tar.gz

RUN tar -xf flarum.tar.gz && rm flarum.tar.gz

EXPOSE 80

COPY config.docker.php flarum-run ./

CMD ["/app/flarum-run"]
