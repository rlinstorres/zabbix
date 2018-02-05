name 'zabbix'
maintainer 'Jailson Silva / Rodrigo Torres'
maintainer_email 'jailson.silva@outlook.com.br'
license 'Apache-2.0'
description 'Installs/Configures zabbix'
long_description 'Installs/Configures zabbix'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/jailson-silva/zabbix/issues'
source_url 'https://github.com/jailson-silva/zabbix/zabbix'
supports 'ubuntu'

depends 'ohai'
