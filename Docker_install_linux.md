# Installare Docker
Installare docker da repository

## Rimuovere precendenti versioni di Docker
La prima cosa da fare è assicurarsi che non ci siano altre versioni di Docker installate sul sistema. 
Per rimuovere eventuali versioni installate utilizzare il comando:
``` 
sudo apt remove docker docker-engine docker.io containerd runc
```

## Preparare la macchina
Aggiornare la cache APT
``` 
sudo apt update
``` 

E installare i vari pacchetti necessari a Docker
``` 
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
``` 

## Aggiungere la chiave di Docker
Per abilitare il repository di Docker bisogna aggiungere la chiave GPG ufficiale
``` 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
``` 

Verificare che la chiave sia stata correttamente
``` 
sudo apt-key fingerprint 0EBFCD88
``` 

## Installare docker
Aggiungere il repository di Docker. Docker ha 3 repository:
* stable
* nightly
* test
In questo caso aggiungeremo quello stable:
``` 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
``` 

Una volta aggiunto il repository bisogna effettuare il refresh della cache APT con il solito comando
``` 
sudo apt update
```

Infine, lanciare il comando per installare l'ultima versione di docker
```
sudo apt install docker-ce docker-ce-cli containerd.io
```

source https://linuxhint.com/install_docker_linux_mint/