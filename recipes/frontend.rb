#
# Cookbook:: .
# Recipe:: frontend
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

apt_package 'zabbix-frontend-php' do
  action :install
end

template '/etc/apache2/conf-enabled/zabbix.conf' do
  source 'apache.conf'
  owner 'zabbix'
  group 'zabbix'
  mode '0644'
end
