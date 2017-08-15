# Execute apt-get update
exec {'apt-update':
  command => '/usr/bin/apt-get update'
}

# Install mongodb package
package { 'mongodb':
  require => Exec['apt-update'],
  ensure => installed,
}

# Run service
service { 'mongodb':
  ensure => running,
  require => Package['mongodb'],
}

# Install redis-server package
package { 'redis-server':
  require => Exec['apt-update'],
  ensure => installed,
}

# Run service
service { 'redis-server':
  ensure => running,
  require => Package['redis-server'],
}

# Create directory
file { '/home/vagrant/my-projects':
  ensure => 'directory',
  owner => 'vagrant',
  group => 'vagrant',
  mode => 750,
}