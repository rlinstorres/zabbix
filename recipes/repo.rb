#
# Cookbook:: .
# Recipe:: repo
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

remote_file '/opt/zabbix-release_3.4-1+xenial_all.deb' do
  source 'http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+xenial_all.deb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'Configure Zabbix repos' do
  command 'dpkg -i /opt/zabbix-release_3.4-1+xenial_all.deb'
  action :run
end

apt_update 'Update repo' do
  action :update
end
