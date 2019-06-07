#!/bin/bash
# Criando uma rede virtual no Docker
dockerNetwork=$(docker network ls | grep fluig-docker-network | awk '{ print $2 }');
if ([ -z $dockerNetwork ]); then
  docker network create -d bridge --subnet 172.18.0.0/16 fluig-docker-network;
  echo 'A rede do docker foi criada com sucesso.';
else
  echo 'A rede do docker está disponível: fluig-docker-network.';
fi
# Iniciando o servidor do Realtime
echo 'Iniciando o servidor Realtime ...';
docker run --name realtime-server --network fluig-docker-network --ip 172.18.0.23 \
     -p 7777:7777 -p 8888:8888 \
     -d docker.fluig.com/fluig/fluig/node:1.6.5-190528;
# Iniciando o servidor de indexação e busca
echo 'Iniciando o servidor de busca e indexação ...';
docker run --name index-server --network fluig-docker-network --ip 172.18.0.24 \
     -p 8983:8983 -d docker.fluig.com/fluig/fluig/solr:1.6.5-190528;
# Iniciando o servidor de banco de dados MySQL
echo 'Iniciando o servidor de banco de dados ...';
docker run --name database-server --network fluig-docker-network --ip 172.18.0.25 \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=YuCBDOZnqE5vL \
    -e MYSQL_USER=fluig \
    -e MYSQL_PASSWORD=OLyVu1gIwWmEr \
    -e MYSQL_DATABASE=fluig \
    -d docker.fluig.com/fluig/mysql;
