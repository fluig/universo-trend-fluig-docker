#!/bin/bash
function exportarVariaveis() {
  # Exporta as variaveis de ambiente
  export $(cat ./env.conf);
}

function lerParametros() {
  case $COMMAND in
      "start")
      iniciarContainers
      ;;
      "stop")
      terminarContainers
      ;;
      *) # opcao desconhecida
      echo "Parâmetros inválidos. As opções são: start e stop."
      ;;
  esac
}

function terminarContainers() {
  # Termina a execução de todos os containers
  echo " Terminando o fluig com o docker-compose ..."
  docker-compose down
  echo " Pronto!"
}

function iniciarContainers() {
  terminarContainers
  echo " Iniciando o fluig com o docker-compose ..."
  docker-compose -f docker-compose.yml up -d
  echo " Pronto!"
}

export COMMAND=$1
exportarVariaveis
lerParametros
