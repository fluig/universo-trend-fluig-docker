#!/bin/bash
### ATENCAO: Remove todos os containers do host
echo "Removendo containers existentes ...";
docker rm $(docker ps -a | awk '{if (NR!=1) {{print $1}}}');
echo "Pronto!";
