class profile::iib::example::deployments()
{
  #
  # First copy the bar file to a location we can read
  #
  file {'/tmp/Helloproject.TestMode.bar':
    ensure =>'present',
    source => '/vagrant/bar_files/Helloproject.TestMode.bar',
  }

  -> iib_deployment {'iib8/NODE1/server_1/Hello':
    ensure => 'present',
    source => '/tmp/Helloproject.TestMode.bar',
  }

  -> iib_deployment {'iib8/NODE1/server_2/Hello':
    ensure => 'present',
    source => '/tmp/Helloproject.TestMode.bar',
  }
}
