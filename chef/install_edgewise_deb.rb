cookbook_file "/tmp/edgewise-agent_<version>.deb" do
  source "edgewise-agent_<version>.deb"
  mode "0755"
  action :create
end

dpkg_package "edgewise-agent_<version>.deb" do
  package_name "edgewise-agent_<version>.deb"
  source "/tmp/edgewise-agent_<version>.deb"
  action :install
end

execute "edge_agent" do
  command "sudo /opt/edgewise/bin/edgewise_setup --set-site-id <site_id>"
end

execute "systemctl" do
  command "sudo systemctl start edgewise-agent"
end
