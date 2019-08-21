class install_edgewise {
  file { '/tmp/edgewise-agent_<version>.rpm':
    ensure => present,
    mode => '0755',
    source => 'puppet:///modules/install_edgewise/edgewise-agent_<version>.rpm',
    tag => 'automatic_safe',
  }

  package { 'edgewise-agent':
    provider => dpkg,
    ensure => installed,
    source => '/tmp/edgewise-agent_<version>.rpm',
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
