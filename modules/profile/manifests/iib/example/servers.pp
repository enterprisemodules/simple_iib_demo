class profile::iib::example::servers
{
  iib_server { 'iib8/NODE1/server_1':
    ensure => 'present',
    status => 'running',
    # execution_group_injection_mode  => 'Disabled',
    # http_connector_cors_enabled     => 'false',
    # http_connector_user_trace_level => 'none',
  }

  #
  # Here is the definition of a Server  with all possible properties.
  # Most of these are default. Use just the ones you need to be different from defaults
  #
  iib_server { 'iib8/NODE1/server_2':
    ensure => 'present',
    status => 'running',
    # execution_group_injection_mode  => 'Disabled',
    # http_connector_cors_enabled     => 'false',
    # http_connector_user_trace_level => 'none',
  }
}
