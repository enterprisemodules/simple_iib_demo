# TODO: Docs
class profile::iib::example::setup()
{
  $version = lookup('profile::installiib::version', String[1])

  iib_broker { "${version}/IIB10NODE":
    ensure                       => 'present',
    status                       => 'running',
    queue_manager                => 'IIB10QM',
    function_level               => 'all',
    http_listener_start_listener => false,
  }

  # mqsichangeproperties IIB10NODE -b webadmin -o HTTPConnector -n port -v 4420
  iib_property {'set_port':
    scope           => "${version}/IIB10NODE",
    restart         => true,
    component       => 'webadmin',
    object_name     => 'HTTPConnector',
    object_property => 'port',
    set_value       => '4421',
  }

  # mqsicreateexecutiongroup IIB10NODE -e default
  -> iib_server { "${version}/IIB10NODE/default":
    ensure => 'present',
    status => 'running',
  }
  #
  # First copy the bar file to a location we can read
  #
  file {'/tmp/Helloproject.TestMode.bar':
    ensure =>'present',
    source => '/etc/puppetlabs/code/environments/production/bar_files/Helloproject.TestMode.bar',
  }

  # mqsideploy IIB10NODE -e default -a /data/software/ns_mqiib_demo-master/software/puppet_setup/bar_files/Helloproject.TestMode.bar
  #
  -> iib_deployment {"${version}/IIB10NODE/default/Hello":
    ensure => 'present',
    source => '/tmp/Helloproject.TestMode.bar',
  }

}
