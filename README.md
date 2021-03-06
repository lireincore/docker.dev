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
#выполнить команду в контейнере
./cli {CONTAINER} {COMMAND}

#выполнить команду в контейнере (в папке проекта)
./cmd {CONTAINER} {PROJECT_NAME} {COMMAND}

#быстрые команды
./go {PROJECT_NAME} {COMMAND}
./php {PROJECT_NAME} {COMMAND}
./dep {PROJECT_NAME} {COMMAND}
./composer {PROJECT_NAME} {COMMAND}
./symfony {PROJECT_NAME} {COMMAND}
./yii {PROJECT_NAME} {COMMAND}
./doctrine {PROJECT_NAME} {COMMAND}
./doctrine-migrations {PROJECT_NAME} {COMMAND}
./yarn {PROJECT_NAME} {COMMAND}
./npm {PROJECT_NAME} {COMMAND}
./webpack {PROJECT_NAME} {COMMAND}
./encore {PROJECT_NAME} {COMMAND}
./phpunit {PROJECT_NAME} {COMMAND}

#создать базу
./pg_createdb {DB_NAME}
./my57_createdb {DB_NAME}
./my80_createdb {DB_NAME}

#удалить базу
./pg_dropdb {DB_NAME}
./my57_dropdb {DB_NAME}
./my80_dropdb {DB_NAME}

#экспортировать базу
./pg_export {DB_NAME}

#импортировать базу
./pg_import {DB_NAME} [FILE]
./my57_import {DB_NAME} [FILE]
./my80_import {DB_NAME} [FILE]

#создать резервную копию базы
./pg_dump {DB_NAME}

#восстановить базу из резервной копии
./pg_restore {DB_NAME} [FILE]

#выполнить команду в БД
./psql {COMMAND}
./mysql57 {COMMAND}
./mysql80 {COMMAND}

#работать с терминалом БД
./psql
./mysql57
./mysql80
```