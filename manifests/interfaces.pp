class network::interfaces($bridged_if = eth0,$interfaces={}, $mappings={}, $auto=[]) {

  package { 'bridge-utils':
	ensure	=> "present",
  }

->
  file { '/etc/network/interfaces':
    content => template('network/interfaces.erb'),
#    notify  => Exec['network-restart'],
  }

  exec { 'network-restart':
      command     => "ifconfig $bridged_if down; /etc/init.d/networking restart",
      path        => '/bin:/usr/bin:/sbin:/usr/sbin',
      refreshonly => true,
  }

}
