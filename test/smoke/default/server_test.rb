# # encoding: utf-8

# Inspec test for recipe .::server

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# Php modules
%w(php7.0-xml php7.0-bcmath php7.0-mbstring zabbix-server-mysql).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
