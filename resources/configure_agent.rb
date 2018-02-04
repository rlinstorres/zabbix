# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :template, [String, Array]
property :cookbook, String
property :variables, Hash, default: {}

action :configure do
  include_recipe 'zabbix::repo'
  if new_resource.template
    # use declare_resource so we can have a property also named template
    declare_resource(:template, "#{node['zabbix']['conf_dir']}/zabbix_agentd.conf") do
      source new_resource.template
      cookbook new_resource.cookbook
      variables(new_resource.variables)
    end
  else
    declare_resource(:template, "#{node['zabbix']['conf_dir']}/zabbix_agentd.conf") do
      source 'zabbix/zabbix_agentd.conf.erb'
      cookbook 'zabbix'
      owner 'root'
      group 'root'
      mode '0644'
    end
  end
end
