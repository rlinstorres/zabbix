# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :db_type, String
property :version, String
property :template, [String, Array]
property :cookbook, String
property :variables, Hash, default: {}

action :install do
  include_recipe 'zabbix::repo'

  if new_resource.db_type == 'mysql'

    apt_package 'zabbix-server-mysql' do
      action :install
    end

    execute 'Initial DB import' do
      command "zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -u#{node['zabbix']['dbuser']} -h#{node['zabbix']['dbhost']} -p#{node['zabbix']['dbpass']} -D#{node['zabbix']['dbname']}"
      action :run
      not_if "mysql -uzabbix -hlocalhost -pzabbix -Dzabbix -e'describe users'"
    end

    template '/etc/zabbix/zabbix_server.conf' do
      source 'zabbix_server.conf'
      owner 'zabbix'
      group 'zabbix'
      mode '0644'
    end
  end
end
