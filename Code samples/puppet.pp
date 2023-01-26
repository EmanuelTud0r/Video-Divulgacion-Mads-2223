class nginx {
  package { 'nginx':
    ensure => installed
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
#Execute with -> puppet agent -t
