# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :version, String
property :template, [String, Array]
property :cookbook, String
property :variables, Hash, default: {}

action :install do
  include_recipe 'zabbix::repo'
  apt_package 'zabbix-server-mysql' do
    action :install
  end

  execute 'Initial DB import' do
    command "zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -u#{node['zabbix']['dbuser']} -h#{node['zabbix']['dbhost']} -p#{node['zabbix']['dbpass']} -D#{node['zabbix']['dbname']}"
    action :run
    not_if "mysql -u#{node['zabbix']['dbuser']} -h#{node['zabbix']['dbhost']} -p#{node['zabbix']['dbpass']} -D#{node['zabbix']['dbname']} -e'describe users'"
  end

  if new_resource.template
    # use declare_resource so we can have a property also named template
    declare_resource(:template, "#{node['zabbix']['conf_dir']}/#{new_resource.name}") do
      source new_resource.template
      cookbook new_resource.cookbook
      variables(new_resource.variables)
    end
  else
    declare_resource(:template, "#{node['zabbix']['conf_dir']}/zabbix_server.conf") do
      cookbook 'zabbix'
      source 'zabbix/zabbix_server.conf.erb'
      owner 'zabbix'
      group 'zabbix'
      mode '0644'
    end
  end
end
