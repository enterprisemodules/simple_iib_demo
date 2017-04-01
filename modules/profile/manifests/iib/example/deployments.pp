class profile::iib::example::deployments()
{
  $nodes   = lookup('profile::iib::example::nodes::list')
  $servers = lookup('profile::iib::example::servers::list')

  #
  # First copy the bar file to a location we can read
  #
  file {'/tmp/Helloproject.TestMode.bar':
    ensure =>'present',
    source => '/vagrant/bar_files/Helloproject.TestMode.bar',
  }
  #
  # Now deploy it on every server on all nodes
  #
  $nodes.each |$node| {
    $servers.each |$server| {
      iib_deployment {"${node}/${server}/Hello":
        ensure => 'present',
        source => '/tmp/Helloproject.TestMode.bar',
      }
    }
  }
}
