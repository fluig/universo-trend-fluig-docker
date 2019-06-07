# Atualiza os pacotes do Ubuntu
sudo apt-get update;
# Pacotes que permitem a conexão com o repositório Docker
sudo apt-get install apt-transport-https \
  ca-certificates \
  curl gnupg-agent \
  software-properties-common;
# Adiciona a chave do repositório Docker no Ubuntu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
# Adiciona o repositório do Docker CE no Ubuntu para arquitetura x86_64 / amd64
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
