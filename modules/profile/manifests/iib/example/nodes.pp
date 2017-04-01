class profile::iib::example::nodes(
  Array[String] $list,
)
{
  iib_node { $list:
    ensure => 'present',
    status => 'running',
  }
}
