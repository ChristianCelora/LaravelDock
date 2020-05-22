# Comandi docker

## Login Docker Hub
Effettuare il login a docker con il comando 
``` 
docker login --username=yourhubusername --email=youremail@company.com
``` 
Inserire la password una volta lanciato il comando. Se tutto va a buon fine dovrebbe uscire il messaggio 
>WARNING: login credentials saved in /home/username/.docker/config.json
>Login Succeeded

## Push e Pull su Docker Hub
Il Docker Hub è dove vengono salvate le vostre immagini. Una volta connessi al docker hub per visualizzare le immagini presenti sul proprio dispositivo lanciare il comando
``` 
docker images
```
### Push 
```
docker push <image>:<tag>
```
### Pull
per effettuare il pull dell'ultima versione
```
docker pull <image>
```
Altrimenti, per scegliere una versione utilizzare il comando
```
docker pull <image>:<tag>
```

## Creare un repository
Andare sul sito di [DockerHub](https://hub.docker.com/) e cliccare su "Create Repository" 

## Connettere Docker Repository a GitHub
Per connettere il repository di Docker a GitHub bisogna innaniztutto connettere Docker a Github:
* Da DockerHub andare in Account Settings -> Linked Accounts. 
* Cliccare sul link di GitHub
* Selezionare le opzioni pubblica e privata 
Una volta connesso l'account basta andare sul repository di Docker, che si vuole collegare ad un repository di GitHub:
* Cliccare su "Manage Repository"
* Dalla pagina di gestione del repository cliccare su "Builds"
* Schiacciare su "Link to GitHub"
* Specificare l'account e il repository alla quale si vuole collegare il repository di Docker.

## Aggiungere un container
Per aggiungere un container utilizzare il comando
```
docker create <image>:<tag>
```
Docker cercherà il container sulla macchina locale. Se non lo trova proverà a scaricare il container da Docker Hub.

# Docker files
## Docker-compose.yml
E' un file di tipo YAML dove vengono definiti i servizi, la configurazione della rete e la configurazione del disco fisso. In questo file specificheremo la struttura di un file di versione 3.x. La versione è specificata all'inizio del file con il tag *version*. Prendiamo come esempio la realizzazione di un contenitore per un server mysql-apache con all'interno Laravel installato:
```
version: '3'

networks:
  laravel:

services:
  apache:
    ...
    networks:
      - laravel

  mysql:
    ...
    networks:
      - laravel
  php:
    ...
    networks:
      - laravel
```
Il tag *services* contiene la configurazione che viene applicata quanodo un container viene eseguito.

Ora, prendiamo per esempio la configurazione del servizio apache all'interno del Laravel
```
apache:
    image: httpd:latest
    container_name: apache
    ports: 
      - "8081:80"
    volumes:
      - ./src:/var/www/html
    depends_on: 
      - php
      - mysql
    networks:
      - laravel
```
Sotto i servizi troviamo il nome dei vari servizi. All'interno di un servizio troviamo le sue configurazioni.
Il tag *image* indica quale immagine deve essere eseguita del servizio. L'immagine si trova su DockerHub e viene specificata nel formato <image>:<tag>
Il tag *container_name* serve per sovrascrivere il nome del container che docker assegna al contenitore (nel caso di apache il container_name di default è httpd)
*Ports* indica la configurazione delle porte tra il nostro pc e il contenitore. 
Le porte hanno il formato
```
<computer_port>:<container_port>
```
Il comando ports effettua il binding tra le due porte.
Il comando *volumnes* effettua un simlink tra una cartella sul nostro dispositivo e una cartella all'interno del contenitore.
Il comando *depends_on* specifica quali servizi devono essere eseguiti prima di eseguire il nostro servizio.

Prendiamo ora per esempio la configurazione del servizio mysql:
```
mysql:
    image: mysql:5.7.30
    restart: unless-stopped
    tty: true
    ports:
      - "3307:3306"
    volumes:
      -./mysql:/var/lib/mysql # necessario se il restart è uguale ad unless-stopped
    environment:
      - MYSQL_DATABASE: db_name
      - MYSQL_user: mysql_user
      - MYSQL_PASSWORD: secret
      - MYSQL_ROOT_PASSWORD: secret
    networks:
      - laravel
```
Di default un container non si riavvia mai. Se si necessita un riavvio si può specificare nel comando *restart* (si può anche specificare unless-stopped, il quale effettuerà un restart riavvio se il container viene arrestato).
Per abilitare l'interfaccia di shell si può abilitare il flag *tty*, settandolo a true.
All'interno del container è possibilie settare delle variabili d'ambiente all'interno del comando *environment*.

Nel caso non si volesse utilizzare per forza un'immagine dal DockerHub, si può utilizzare al posto del comando image il comando *build*. Prendiamo per esempio questa configurazione di un servizio PHP, dove vogliamo installare, oltre all'immagine, anche le varie estensioni PHP necessario per un contenitore Laravel.
```
php:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - ./src:/var/www/html
    ports:
      - "9000:9000"
    networks:
      - laravel
```
all'interno del comando *build* troviamo i due comandi. *context* indica la cartella dove cercare il dockerfile. il comando *dockerfile* specifica il nome del dockerfile. Il dockerfile è un file contente istruzioni per effettuare il build dell'immagine. Il dockerfile viene utilizzato durante il build.
In questo caso il nostro dockerfile risulterà come riportato sotto:
```
FROM php:7.3.18-zts-alpine3.11

RUN docker-php-ext-install pdo pdo_mysql
```
Con il comando *FROM* viene specificata l'immagine da recuperare e con il comando *RUN* vengono installate le estensioni di php necessarie (in questo caso saranno pdo e pdo_mysql).