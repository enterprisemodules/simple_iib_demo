class profile::iib::example::servers(
  Array[String] $list
)
{
  $nodes = lookup('profile::iib::example::nodes::list')
  $nodes.each |$node| {
    $list.each |$server| {
      iib_server { "${node}/${server}":
        ensure => 'present',
        status => 'running'
      }
    }
  }
}
