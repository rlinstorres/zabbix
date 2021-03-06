#
# Cookbook:: zabbix
# Spec:: proxy
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

require 'spec_helper'

describe 'zabbix::proxy' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04', step_into: ['zabbix_install_proxy'])
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Include Recipe repos' do
      expect(chef_run).to include_recipe('zabbix::repo')
    end

    it 'Install zabbix frontend' do
      expect(chef_run).to install_apt_package('zabbix-proxy-mysql')
    end

    it 'Create Template zabbix conf' do
      expect(chef_run).to create_template('/etc/zabbix/zabbix_proxy.conf')
    end

    it 'Install proxy as custom resource' do
      expect(chef_run).to install_zabbix_install_proxy('zabbix-proxy')
    end
  end
end
