class profile::iib::example::instances()
{
  iib_instance { 'IIB107':
    ensure => 'present',
    os_user => 'iibadmin',
    home_directory => '/opt/ibm/mqsi/iib-10.0.0.7',
  }
}
