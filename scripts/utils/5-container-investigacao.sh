#!/bin/bash
### Cria um container com o Ubuntu Server para investigacao dos containers criados na mesma rede
### Lembre executar/instalar os seguintes comandos/recursos no container recém criado:
### apt-get update
### apt-get install iputils-ping
### apt-get install dnsutils
### apt install net-tools
### apt install telnet
### apt-get install curl
echo "Criando o container para explorar o ambiente docker ...";
docker pull ubuntu;
docker run --name ubuntu-server --network fluig-docker-network --ip 172.18.0.26 -it -d ubuntu;
