if defined?(ChefSpec)
  def zabbix_install_agent(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(install_agent, install, resource_name)
  end
end
