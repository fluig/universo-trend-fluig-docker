#!/bin/bash
# Iniciando o servidor do fluig
echo 'Iniciando o servidor do fluig ...';
docker run --name fluig-server --network fluig-docker-network --ip 172.18.0.22 \
   -p 80:80 -p 8080:8080 -p 5555:5555 -v /opt/volume:/opt/volume \
   -e dbType=mysql \
   -e dbServer=database-server \
   -e dbPort=3306 \
   -e dbUser=fluig \
   -e dbPassword=OLyVu1gIwWmEr \
   -e dbName=fluig \
   -e solrUrl=http://index-server:8983/solr \
   -e solrIsRemote=true \
   -e solrIsCloud=false \
   -e lsHost=ls.fluig.io \
   -e lsPort=5555 \
   -e fluigHost=fluig-server \
   -e fluigPort=8080 \
   -e fluigUrl=http://utlab.fluig.io:8080 \
   -e fluigXms=2g \
   -e fluigXmx=6g \
   -e smtpHost=fluig-server \
   -e smtpPort=25 \
   -e nodeChatAddress=realtime-server:7777 \
   -e nodeRealtimeAddress=realtime-server:8888 \
   -d docker.fluig.com/fluig/fluig/fluig:1.6.5-190528 '-b=0.0.0.0';
