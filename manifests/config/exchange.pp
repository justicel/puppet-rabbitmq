define rabbitmq::config::exchange (
  $vhost      = '/',
  $type       = 'direct',
  $webui_port = '15672',
  $cli_user   = 'guest',
  $cli_pass   = 'guest',
) {

  include rabbitmq::config::admininstall
 
  #Run the exchange creation command
  exec { "rabbitmqadmin-exchange-${name}":
    command => "rabbitmqadmin declare exchange --username=${cli_user} \
                --password=${cli_pass} --vhost=${vhost} name=${name} type=${type}",
    path    => ['/usr/local/bin','/bin','/sbin','/usr/bin','/usr/sbin'],
    require => File['/usr/local/bin/rabbitmqadmin'],
  }

} 
