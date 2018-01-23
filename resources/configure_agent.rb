# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :template, [String, Array]
property :cookbook, String
property :variables, Hash, default: {}

action :configure do
  include_recipe 'zabbix::repo'
  if new_resource.template
    # use declare_resource so we can have a property also named template
    declare_resource(:template, "#{node['zabbix']['agent_conf_dir']}/#{new_resource.name}") do
      source new_resource.template
      cookbook new_resource.cookbook
      variables(new_resource.variables)
    end
  end
end
