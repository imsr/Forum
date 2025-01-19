`docker-compose.yml` можно настроить под себя.

Пример набора файлов и директорий для работы:

```
имя                    uid   права
----------------------------------
/storage               1000   770
/assets                1000   770
/db                    0      770
.env                   0      770
docker-compose.yml     0      775
config.docker.php      1000   770
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