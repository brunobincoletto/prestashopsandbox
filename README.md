# prestashopsandbox
Script para criar sandbox automaticamente a partir de uma instalação Prestashop.

Instalação

1 - Crie um diretório com nome /utils/ dentro da pasta /var/

2 - Copie os arquivos sandbox.sh, dbsandbox.sql e settings.inc.php (localizado na pasta /config/ de sua instalação Prestashop), para pasta /var/utils/

3 - Altere em todos os arquivos o usuário, senha e nome do banco de dados.

4 - Altere a URL no arquivo dbsandbox.sql para a URL de sua sandbox.

5 - Dentro da pasta /cd/utils/ execute o comando $chmod +x sandbox.sh ; perl -i -pe's/\r$//;' sandbox.sh

6 - Para executar o script utilize o comando ./sandbox.sh dentro da pasta /var/utils/

OBS: Não se esqueça de substituir os nomes de banco de dados, senhas, usuários, etc...