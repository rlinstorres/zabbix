if defined?(ChefSpec)
  def zabbix_install_agent(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(install_agent, install, resource_name)
  end

  def zabbix_install_agent(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(install_agent, remove, resource_name)
  end

  def zabbix_configure_agent(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(configure_agent, configure, resource_name)
  end

  def zabbix_install_frontend(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(install_frontend, install, resource_name)
  end

  def zabbix_install_server(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(install_install, install, resource_name)
  end
end
