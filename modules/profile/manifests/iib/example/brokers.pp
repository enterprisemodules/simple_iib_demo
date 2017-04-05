class profile::iib::example::brokers(
  Array[String] $list,
)
{
  iib_broker { $list:
    ensure => 'present',
    status => 'running',
  }
}
