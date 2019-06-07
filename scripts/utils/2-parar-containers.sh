#!/bin/bash
### Parar containers
echo "Terminando containers em execução ...";
docker stop $(docker ps -a | awk '{if (NR!=1) {{print $1}}}');
echo "Pronto!";
