#
# Cookbook:: .
# Recipe:: agent
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

# include_recipe 'zabbix::repo'

# apt_package 'zabbix-agent' do
#   action :install
# end

# service 'zabbix-agent' do
#   action :start
# end

# template "node['zabbix']['agent_conf_dir']/#{zabbix_agentd.conf}" do
#   source 'zabbix_agentd.conf'
#   owner 'root'
#   group 'root'
#   mode '0644'
#   action :create
# end

zabbix_install_agent 'zabbix-agent' do
  version '3.4.1'
  action  :install
end

zabbix_configure_agent 'zabbix' do
  hostname 'localhost'
  server 'localhost'
  serveractive 'localhost'
  template 'zabbix_agentd.conf'
  cookbook 'zabbix'
  variables(
    logfiles: '/var/log/teste'
  )
end
