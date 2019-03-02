# Docker development environment

## Развертывание окружения

``` bash
cd ~
git clone git@github.com:lireincore/docker.dev.git
cd ~/docker.dev
cp .env.dist .env
cp docker-compose.tmpl.yml docker-compose.yml
cp containers/nginx/tmpl/* containers/nginx/conf
```

- скопируйте в каталог containers/nginx/conf конфигурации используемых проектов
- файл .env можно редактировать, если потребуется
- файл docker-compose.yml можно редактировать, если потребуется

``` bash
./build
```

### Команды

``` bash
./composer {PROJECT_NAME} {COMMAND}

./symfony {PROJECT_NAME} {COMMAND}

./yii {PROJECT_NAME} {COMMAND}

./yarn {PROJECT_NAME} {COMMAND}

./npm {PROJECT_NAME} {COMMAND}

./webpack {PROJECT_NAME} {COMMAND}

#выполнить команду в контейнере php-cli (в папке проекта)
./php-cli {PROJECT_NAME} {COMMAND}

#выполнить команду в контейнере node-cli (в папке проекта)
./node-cli {PROJECT_NAME} {COMMAND}

#выполнить команду в контейнере
./cmd {CONTAINER} {COMMAND}

#создать базу
./pg_createdb {DB_NAME}
./my_createdb {DB_NAME}

#удалить базу
./pg_dropdb {DB_NAME}
./my_dropdb {DB_NAME}

#создать резервную копию базы
./pg_dump {DB_NAME}

#восстановить базу из резервной копии
./pg_restore {DB_NAME}

#выполнить команду в терминале БД
./psql {COMMAND}
./mysql {COMMAND}

#работать с терминалом БД
./psql
./mysql
```