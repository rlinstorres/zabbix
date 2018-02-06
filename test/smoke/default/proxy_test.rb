# # encoding: utf-8

# Inspec test for recipe .::proxy

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe package('zabbix-proxy') do
  it { should be_installed }
end
