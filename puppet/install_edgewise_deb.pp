class install_edgewise {
  file { '/tmp/edgewise-agent_<version>.deb':
    ensure => present,
    mode => '0755',
    source => 'puppet:///modules/install_edgewise/edgewise-agent_<version>.deb',
    tag => 'automatic_safe',
  }

  package { 'edgewise-agent':
    provider => dpkg,
    ensure => installed,
    source => '/tmp/edgewise-agent_<version>.deb',
  }

  exec { 'edgewise-agent-set-siteid':
    user => 'root',
    command => 'sudo /opt/edgewise/bin/edge_agent --cli --set-site-id <site_id>',
    logoutput => true,
    unless => '/usr/bin/test -d /opt/edgewise',
    tag => 'automatic_safe',
  }

  service { 'edgewise-agent':
    ensure => running,
    enable => true,
  }
}
