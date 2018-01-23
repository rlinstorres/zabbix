#
# Cookbook:: .
# Recipe:: server
#
# Copyright:: 2018, Jailson Silva
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'zabbix::repo'

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

# zabbix_install_server do
#   version
#   template
#   cookbook
#   variables
# end
