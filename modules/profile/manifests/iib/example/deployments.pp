class profile::iib::example::deployments()
{
  $brokers   = lookup('profile::iib::example::brokers::list')
  $servers = lookup('profile::iib::example::servers::list')

  #
  # First copy the bar file to a location we can read
  #
  file {'/tmp/Helloproject.TestMode.bar':
    ensure =>'present',
    source => '/vagrant/bar_files/Helloproject.TestMode.bar',
  }
  #
  # Now deploy it on every server on all brokers
  #
  $brokers.each |$broker| {
    $servers.each |$server| {
      iib_deployment {"${broker}/${server}/Hello":
        ensure => 'present',
        source => '/tmp/Helloproject.TestMode.bar',
      }
    }
  }
}
