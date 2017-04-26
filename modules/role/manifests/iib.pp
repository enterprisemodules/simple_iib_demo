# Docs
class role::iib()
{
  contain ::profile::base
  contain ::profile::installiib
  contain ::profile::iib::example

  Class['::profile::base']
  -> Class['::profile::installiib']
  -> Class['::profile::iib::example']

}
