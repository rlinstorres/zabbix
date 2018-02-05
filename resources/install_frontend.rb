# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :version, [String, Array]
property :template,  String
property :cookbook,  String
property :source,    String
property :variables, Hash, default: {}

action :install do
  include_recipe 'zabbix::repo'

  apt_package new_resource.name do
    version new_resource.version
    action :install
  end

  if new_resource.template
    # use declare_resource so we can have a property also named template
    declare_resource(:template, '/etc/apache2/conf-enabled/zabbix.conf') do
      source new_resource.template
      cookbook new_resource.cookbook
      variables(new_resource.variables)
    end
  else
    declare_resource(:template, '/etc/apache2/conf-enabled/apache.conf') do
      cookbook 'zabbix'
      source 'apache/apache.conf.erb'
      owner 'root'
      group 'root'
      mode '0644'
    end
  end

  declare_resource(:template, "#{node['zabbix_php']['conf_dir']}/php.ini") do
    source node['zabbix_php']['ini']['template']
    cookbook node['zabbix_php']['ini']['cookbook']
    owner 'root'
    group node['root_group']
    mode '0644'
    manage_symlink_source true
    variables(directives: node['zabbix_php']['directives'])
  end
end

action :remove do
  apt_package new_resource.name do
    action :remove
  end
end
