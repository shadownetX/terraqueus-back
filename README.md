## TERRAQUEUS - BACKEND

See additional projects:
* [Terraqueus - API](https://github.com/shadownetX/terraqueus-api)
* [Tarrequeus - FRONTEND](https://github.com/shadownetX/terraqueus-front)

**Requirements:**

* Docker: https://www.docker.com/get-docker
* Docker-compose: https://docs.docker.com/compose/gettingstarted/

> You could use ```ctop``` for monitoring docker containers.
>
>```sudo wget https://github.com/bcicen/ctop/releases/download/v0.7/ctop-0.7-linux-amd64 -O /usr/local/bin/ctop```
>
>```sudo chmod +x /usr/local/bin/ctop```

**About this stack:**

* **[nginx:1.13-alpine]** :  Use ```http://localhost/``` to access the website or use ```http://terraqueus.dev``` with this configuration : ```sudo sh -c "echo '127.0.0.1   terraqueus.dev' >> /etc/hosts"```
* **[php:7.2-fpm-alpine]** 
* **[redis:4-alpine]** Check "About : Redis" section.
* **[node:9-alpine]** Check "About : Symfony 4 - Encore" section.

### Manipulate containers

| **For short** | **Makefile command**        | **Docker command**                  | **Purpose**                          |
|---------------|-----------------------------|-------------------------------------|---------------------------------------|
| BUILD         | **```make build```**        | ```bin/docker build```              | Build the app                         |
| RUN           | **```make run```**          | ```bin/docker run```                | Run the app                           |
| STOP          | **```make stop```**         | ```bin/docker stop```               | Stop the app                          |
| DESTROY       | **```make destroy```**      | ```bin/docker destroy```            | Destroy the app                       |
| INSTALL       | **```make install```**      | ```bin/docker install```            | Initialize the app                    |
| EXPELLIARMUS  | **```make expelliarmus```** | ```bin/docker expelliarmus```       | Prune docker env                      |
| AVADAKEDAVRA  | **```make avadakedavra```** | ```bin/docker avadakedavra```       | Stop then destroy containers + images |

### Access to containers

| **For short** | **Docker command**                    | **Purpose**                                            |
|---------------|---------------------------------------|--------------------------------------------------------|
| EXEC-PHP      | ```bin/docker exec-php [ARGS]```      | Execute a command inside the php container             |
| EXEC-ROOT     | ```bin/docker exec-php-root [ARGS]``` | Execute a command as ROOT inside the php container     |
| EXEC-NODE     | ```bin/docker exec-node [ARGS]```     | Execute a command inside the nodejs container          |
| BASH          | ```bin/docker bash```                 | Access /bin/bash or sh (alpine)                        |
| COMPOSER      | ```bin/docker composer [ARGS]```      | Execute composer                                       |
| SYMFONY       | ```bin/docker console [ARGS]```       | Execute Symfony's console (bin/console)                |

### Informations about containers

| **For short** | **Docker command**                           | **Purpose**                           |
|---------------|----------------------------------------------|---------------------------------------|
| PS            | ```bin/docker ps```                          | List all running containers           |

##### About : [Redis](https://redis.io/)

Check configuration using : ```docker-compose -f docker/docker-compose.yml exec redis redis-cli ping```.
It should display ```PONG```!

##### About : [Symfony 4 - Encore](https://symfony.com/doc/current/frontend.html)

| **usage**      | **env**        | **commands**                                                                                  | **On start** |
|----------------|----------------|-----------------------------------------------------------------------------------------------|--------------|
| webpack-encore | dev            | ```bin/docker exec-node node_modules/.bin/encore dev```                                       | n            |
| webpack-encore | continuous dev | ```bin/docker exec-node node_modules/.bin/encore dev --watch --watch-aggregate-timeout 100``` | **Y**        |
| webpack-encore | prod           | ```bin/docker exec-node node_modules/.bin/encore production```                                | n            |