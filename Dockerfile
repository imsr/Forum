FROM dunglas/frankenphp:1.4-php8.3-alpine

ENV UID=0
ENV GID=0

ENV SERVER_NAME=:80

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    apk add --no-cache su-exec && \
    install-php-extensions \
    gd \
    exif \
    pdo_mysql

ADD --chmod=775 https://getcomposer.org/download/2.8.4/composer.phar /usr/local/bin/composer

ADD https://github.com/flarum/installation-packages/raw/main/packages/v1.x/flarum-v1.x-php8.3.tar.gz flarum.tar.gz

RUN tar -xf flarum.tar.gz && rm flarum.tar.gz

RUN composer require \
  flarum-lang/russian \
  fof/upload \
  fof/nightmode \
  fof/linguist \
  fof/oauth \
  blt950/oauth-generic \
  fof/passport

COPY config.docker.php flarum-run ./

CMD ["/app/flarum-run"]
