class profile::iib::example::brokers()
{

    iib_broker { 'iib8/NODE1':
      ensure => 'present',
      status => 'running',
    }

}
