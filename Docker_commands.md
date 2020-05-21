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
Il Docker Hub è dove vengono salvate le vostre immagini. Una volta connessi al docker hub per visualizzare le immagini presenti sul proprio account lanciare il comando
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
