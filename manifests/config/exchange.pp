define rabbitmq::config::exchange (
  $vhost      = '/',
  $type       = 'direct',
  $webui_port = '15672',
) {

  #Install rabbitmqadmin to the host
  exec { 'rabbitmqadmin-download':
    command => 'wget http://localhost:15672/cli/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin',
    path    => ['/usr/bin', '/bin', '/sbin', '/usr/sbin'],
    creates => '/usr/local/bin/rabbitmqadmin',
  } 
  file { '/usr/local/bin/rabbitmqadmin':
    owner   => root,
    group   => root,
    mode    => '0655',
    require => Exec['rabbitmqadmin-download'],
  } 
 
  #Run the exchange creation command
  exec { 'rabbitmqadmin-exchange':
    command => "rabbitmqadmin declare exchange --vhost=${vhost} name=${name} type=${type}",
    path    => ['/usr/local/bin','/bin','/sbin','/usr/bin','/usr/sbin'],
    require => File['/usr/local/bin/rabbitmqadmin'],
  }

} 
