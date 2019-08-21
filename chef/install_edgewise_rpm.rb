cookbook_file "/tmp/edgewise-agent_<version>.rpm" do
  source "edgewise-agent_<version>.rpm"
  mode "0755"
  action :create
end

dpkg_package "edgewise-agent_<version>.rpm" do
  package_name "edgewise-agent_<version>.rpm"
  source "/tmp/edgewise-agent_<version>.rpm"
  action :install
end

execute "edge_agent" do
  command "sudo /opt/edgewise/bin/edge_agent --cli --set-site-id <site_id>"
end

execute "systemctl" do
  command "sudo systemctl start edgewise-agent"
end
