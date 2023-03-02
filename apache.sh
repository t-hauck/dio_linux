#!/usr/bin/env bash

echo "Atualizando o Servidor"
apt update && apt upgrade -y && apt install apache2 unzip wget -y
sleep 3; clear

echo "Baixando e copiando os arquivos da aplicação"
cd /var/www/html/
wget -c https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cp -R linux-site-dio-main/* .
rm -rf linux-site-dio-main main.zip
