include apt, nginx, php, java

exec { 'apt-get update':
  command => 'apt-get update',
  path    => '/usr/bin',
}

package { ['vim', 'nano', 'git']:
  ensure => present,
}

package { ['redis-server', 'redis-tools']:
  ensure  => present,
}

service { 'redis-server':
  ensure  => 'running',
  require => Package['redis-server'],
}

class { 'composer':
  auto_update => true,
}

class { '::mysql::server':
  root_password => 'root',
  remove_default_accounts => true,
  override_options => {
    'mysqld' => {
      'character_set_server' => 'utf8',
      'collation_server' => 'utf8_general_ci'
    }
  },
  package_name => 'mysql-server-5.6'
}

class { '::mysql::client':
  package_name => 'mysql-client-5.6'
}

mysql::db { 'pim':
  user     => 'pim',
  password => 'pim',
  host     => '%',
  grant    => ['ALL'],
  charset  => 'utf8',
  collate  => 'utf8_general_ci'
}
