exec { 'splunk-deb-repo':
  cwd => '/vagrant',
  command => '/usr/bin/python -m SimpleHTTPServer 3001 &',
  before => Class['splunk'],
}

class { "splunk":
  install        => "forwarder", # This is the default, can be omitted 
  install_source => "http://localhost:3001/splunkforwarder-6.0.1-189883-linux-2.6-amd64.deb",
  forward_server => "10.0.3.100:9997", # Use host:port format
}
