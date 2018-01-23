# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :version, String

action :install do
  include_recipe 'zabbix::repo'

  apt_package new_resource.name do
    version new_resource.version
    action :install
  end
end

action :remove do
  apt_package new_resource.name do
    action :remove
  end
end
