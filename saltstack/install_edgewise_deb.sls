edgewise-agent:
  pkg.installed:
    - sources:
      - edgewise-agent: salt://edgewise-agent_<version>.deb
  cmd.run:
    - name: /opt/edgewise/bin/edge_agent --cli --set-site-id <site_id>
  service.running:
    - enable: True
