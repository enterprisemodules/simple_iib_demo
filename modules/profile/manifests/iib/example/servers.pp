class profile::iib::example::servers(
  Array[String] $list
)
{
  $brokers = lookup('profile::iib::example::brokers::list')
  $brokers.each |$broker| {
    $list.each |$server| {
      iib_server { "${broker}/${server}":
        ensure => 'present',
        status => 'running'
      }
    }
  }
}
