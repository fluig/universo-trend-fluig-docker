#!/bin/bash
# Exemplo instalação do Docker CE no Ubuntu
sudo apt-get update;
sudo apt-get install docker-ce docker-ce-cli containerd.io;
sudo docker run hello-world
sudo docker version;
# Como usar o docker sem o sudo?
sudo groupadd docker;
sudo usermod -aG docker $USER;
# Fazer logout e login novamente
docker run hello-world;
