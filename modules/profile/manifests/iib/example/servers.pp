class profile::iib::example::servers(
  Array[String] $list
)
{
  $nodes = lookup('profile::iib::example::brokers::list')
  $nodes.each |$node| {
    $list.each |$server| {
      iib_server { "${node}/${server}":
        ensure => 'present',
        status => 'running'
      }
    }
  }
}
