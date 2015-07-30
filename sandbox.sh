#!/bin/bash
echo "Iniciando criacao de Sandbox..."
echo "Deletando e criando novo banco de dados para sandbox..."
mysql -u root -pUSUARIODOBANCO -e "DROP DATABASE bancodadossandbox; CREATE DATABASE bancodadossandbox"
echo "Limpando diretorio da sandbox..."
cd /var/www/sandbox/
rm * -Rf 
cd /var/utils/ 
echo "Copiando arquivos de producao para pasta de sandbox..."
cp -r /var/www/siteproducao/* /var/www/sandbox/
echo "Deletando arquivo de configuracao de producao - settings.inc.php"
rm /var/www/sandbox/config/settings.inc.php 
echo "Copiando arquivo de configuracao da sandbox - settings.inc.php"
cp /var/utils/settings.inc.php /var/www/sandbox/config/
echo "Fornecendo permissoes para sandbox..."
chmod 777 /var/www/sandbox -R
echo "Realizando dump do banco de dados de producao..."
mysqldump -u USUARIODOBANCO -pSENHADOBANCO -h localhost bancodadosproducao > bancodadosproducao.sql
echo "Copiando dump de producao para sandbox..."
mysql -u USUARIODOBANCO -pSENHADOBANCO -h localhost bancodadossandbox < bancodadosproducao.sql
echo "Deletando dump de producao por seguranca..."
rm /var/utils/bancodadosproducao.sql 
echo "Acessando e alterando banco de dados da sandbox..."
mysql -u USUARIODOBANCO -pSENHADOBANCO -e "source dbsandbox.sql"
echo "Sandbox criada com sucesso!!!"
exit

#comando para funcionar o script $ chmod +x sandbox.sh ; perl -i -pe's/\r$//;' sandbox.sh