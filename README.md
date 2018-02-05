# Zabbix


Este cookbook fornece recursos para a instalação do Zabbix Proxy/Server/Agent de uma maneira fácil e rápida.

Por enquando este cookbook suporta a instalação do zabbix apenas para o MySQL


## Requirements


### Cookbooks


Este cookbook tem uma dependência direta de outros cookbooks do supermaket, são eles:


- `ohai` Estou usando para coletar o hostname e renderizá-lo nos templates


### Platforms


No momento este cookbook atende apenas uma versão o linux, sendo ela:


- Ubuntu 16.04


### Chef


- Chef 13+


## Attributes


Os atributos deste cookbook estão logicamente separados em arquivos diferentes. Alguns atributos são definidos apenas para atender uma receita específica.



### zabbix::agent

Os atributos para atender a recipe para a instalação dos agentes do Zabbix são:

- `node['zabbix']['server']` - Zabbix Server
- `node['zabbix']['server']` - Server Active

### zabbix::frontend

Os atributos para a instalação do frontend do zabbix que basicamente são as configurações do PHP e apache. 


- `node['zabbix_php']['directives']` - Uma lista de diretivas chave|valor para ser renderizada no template php.ini decidi usar diretivas para evitar repetições de código, uma vez que o php.ini é um arquivo extenso.


- `node['zabbix_php']['ini']['template']` - Arquivo fonte do template do php.ini


- `node['zabbix_php']['ini']['cookbook']` - Coobook referente ao template php.ini


- `node['zabbix_php']['conf_dir']` - Diretório onde o arquivo php.ini será gerado.


- `node['zabbix_php']['date.timezone']` - Configuração de timezone do php.ini.


### zabbix::proxy

Este cookbook também fornece a instalação do proxy, caso queira usar, os atributos são:


- `node['zabbix']['proxy_dbuser']` - Usuário do banco de dados Mysql


- `node['zabbix']['proxy_dbhost']` - Host do banco de dados Mysql.


- `node['zabbix']['proxy_dbpass']` - Senha de acesso do usuario.


- `node['zabbix']['proxy_dbname']` - Nome do bando de dados.


- `node['zabbix']['zabbix_server']` - DNS ou IP do Zabbix Server.


### zabbix::server

Para s instalção do server do Zabbix os atributos disponíveis são:

- `node['zabbix']['php_modules']` - Módulos do PHP


- `node['zabbix']['dbuser']` - Usuário do banco de dados Mysql


- `node['zabbix']['dbhost']` - Host do banco de dados Mysql.


- `node['zabbix']['dbpass']` - Senha de acesso do usuário.


- `node['zabbix']['dbname']` - Nome do bando de dados.


- `node['zabbix']['date_time_zone']` - Informações de timezone para serem renderizadas nos arquivos de configurações.


Aqui vale uma uma nota, tanto na instalação o Proxy quanto do Server estou utilizando o *guards* para validar se o DB existe e se a tabela "*Users*" está criada, se este requisito for atendido, o CHEF vai fazer um *bypass* na task que é referente ao setup inicial do banco, que esta descrito na documentação oficial do [Zabbix](https://www.zabbix.com/documentation/3.4/manual/installation/install_from_packages/debian_ubuntu).
 


