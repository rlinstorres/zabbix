# Zabbix Server confs
default['zabbix']['php_modules'] = %w(php7.0-xml php7.0-bcmath php7.0-mbstring)
default['zabbix']['dbuser'] = 'zabbix'
default['zabbix']['dbhost'] = 'localhost'
default['zabbix']['dbpass'] = 'zabbix'
default['zabbix']['dbname'] = 'zabbix'
default['zabbix']['date_time_zone'] = 'America/Sao_Paulo'

# Zabbix proxy confs
default['zabbix']['proxy_dbuser'] = 'zabbix_proxy'
default['zabbix']['proxy_dbhost'] = 'localhost'
default['zabbix']['proxy_dbpass'] = 'zabbix_proxy'
default['zabbix']['proxy_dbname'] = 'zabbix_proxy'
default['zabbix']['zabbix_server'] = 'localhost'
default['zabbix']['proxy_hostname'] = 'Zabbix proxy'

# Zabbix Agent confs
default['zabbix']['server'] = 'localhost'
default['zabbix']['server_active'] = 'localhost'

# Defaults
default['zabbix']['conf_dir'] = '/etc/zabbix'
default['zabbix']['hostname'] = node['hostname']

# Informations to php.ini
default['zabbix_php']['directives'] = {}
default['zabbix_php']['ini']['template'] = 'php/php.ini.erb'
default['zabbix_php']['ini']['cookbook'] = 'zabbix'
default['zabbix_php']['conf_dir'] = '/etc/php/7.0/apache2'
default['zabbix_php']['date.timezone'] = 'America/Sao_Paulo'
