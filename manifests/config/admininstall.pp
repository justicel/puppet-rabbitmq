class rabbitmq::config::admininstall {

  #Install rabbitmqadmin to the host
  exec { 'rabbitmqadmin-download':
    command => 'wget http://localhost:15672/cli/rabbitmqadmin \
                -O /usr/local/bin/rabbitmqadmin',
    path    => ['/usr/bin', '/bin', '/sbin', '/usr/sbin'],
    creates => '/usr/local/bin/rabbitmqadmin',
  }
  file { '/usr/local/bin/rabbitmqadmin':
    owner   => root,
    group   => root,
    mode    => '0655',
    require => Exec['rabbitmqadmin-download'],
  }

}
