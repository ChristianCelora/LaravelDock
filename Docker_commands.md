# Comandi docker


## Login Docker Hub
Effettuare il login a docker con il comando 
``` 
docker login --username=yourhubusername --email=youremail@company.com
``` 
Inserire la password una volta lanciato il comando. Se tutto va a buon fine dovrebbe uscire il messaggio 
>WARNING: login credentials saved in /home/username/.docker/config.json
>Login Succeeded

## Push e Pull Docker Hub
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

## Creare un container
