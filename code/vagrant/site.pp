exec { "apt-get update":
  command => "/usr/bin/apt-get update"
}

class {'postgresql::server': 
  listen => ['*',],
  acl => ['host all all 0.0.0.0/0 md5', 'local all all trust', ],
  require => Exec['apt-get update'],
}

postgresql::db { 'jungles':
  password => '1234',
  owner => 'jungles',
  require => Service['postgresql-system-9.1'],
}

pg_user {'vagrant':
  ensure   => present,
  password => '1234',
  superuser => true,
  require => Service['postgresql-system-9.1'],
}

exec { 'psql -U jungles -d jungles < /vagrant/vagrant/dump.sql':
  require => Pg_database['jungles'],
  path => "/usr/bin",
}
