# Ponemos los ficheros .deb en el directorio /vagrant
exec { 'splunk-deb-repo':
  cwd => '/vagrant',
  command => '/usr/bin/python -m SimpleHTTPServer 3001 &',
  before => Class['splunk'],
}

# Modify init.d script to accept license
exec { 'splunk-accept-license':
  command => '/bin/sed -i "s/--answer-yes/--accept-license --answer-yes/" /etc/init.d/splunk',
  require => Package['splunk'],
  before => Service['splunk'],
}

class { "splunk":
  install        => "server",
  install_source => "http://localhost:3001/splunk-6.0.1-189883-linux-2.6-amd64.deb",
  admin_password => "password",
}
