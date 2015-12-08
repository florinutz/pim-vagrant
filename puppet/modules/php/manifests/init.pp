class php {
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

  package { [ 'php5-fpm', 'php5-cli', 'php5-intl', 'php5-gd', 'php5-mcrypt', 'php5-imagick', 'php5-redis', 'php5-mysql', 'php5-curl', 'php5-apcu' ]:
    ensure => present,
    require => Exec['apt-get update'],
  }
}
