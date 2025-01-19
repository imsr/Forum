`docker-compose.yml` можно настроить под себя.

Пример набора файлов и директорий для работы:

```
/storage
/assets
/db
.env
docker-compose.yml
config.docker.php
```

Пример `.env` (должен быть недоступен другим пользователям):

```
RUN_UID=1000
RUN_GID=1000
DB_USERNAME=flarum
DB_PASSWORD=pa$$word
LISTEN_PORT=20001
BASE_URL=https://forum.imsr.su
INSTALL_ADMIN_USERNAME=admin
INSTALL_ADMIN_PASSWORD=admin
INSTALL_ADMIN_EMAIL=admin@example.com
```


Для установки расширений необходимо добавить их в Dockerfile и пересобрать образ.

Иначе при пересоздании контейнера все расширения, которые были установлены отдельно, удалятся.

```dockerfile
RUN composer require \
        flarum-lang/russian \
        fof/upload \
        fof/nightmode \
        fof/linguist
```