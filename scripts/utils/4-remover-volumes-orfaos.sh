#!/bin/bash
### Remove os volumes orfaos criados por containers já excluídos
echo "Removendo volumes orfãos ...";
docker volume rm $(docker volume ls -qf dangling=true)
echo "Pronto!";
