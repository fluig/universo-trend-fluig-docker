#!/bin/bash
### Iniciar containers
echo "Iniciando containers ...";
docker start $(docker ps -a | awk '{if (NR!=1) {{print $1}}}');
echo "Pronto!"
