edgewise-agent:
  pkg.installed:
    - sources:
      - edgewise-agent: salt://edgewise-agent_<version>.rpm
  cmd.run:
    - name: /opt/edgewise/bin/edgewise_setup --set-site-id <site_id>
  service.running:
    - enable: True
