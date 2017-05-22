class profile::installiib(
  String $source_location,
  String $version,
){
  iib_install::installiib {$version:
    source_location => $source_location,
    version         => $version,
  }

  #
  # For now lock on fixpack 8 and use the name as such
  #
  -> iib_instance { 'iib8':
    ensure         => 'present',
    os_user        => 'iibadmin',
    home_directory => "/opt/IBM/iib-${version}",
  }

}
