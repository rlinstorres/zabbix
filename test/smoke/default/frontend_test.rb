# # encoding: utf-8

# Inspec test for recipe .::frontend

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# Decribe zabbix package
describe package('zabbix-frontend-php') do
  it { should be_installed }
end
