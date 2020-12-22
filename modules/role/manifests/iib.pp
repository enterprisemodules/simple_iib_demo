# Docs
class role::iib()
{
  contain ::profile::base
  contain ::ibm_profile::iib_machine

  Class['::profile::base']
  -> Class['::ibm_profile::iib_machine']

}
