#
# Install IIB with the specfied version and location of the tar file
#
class profile::installiib(
  String[1] $source_location,
  String[1] $file_name,
  String[1] $version,
){
  iib_install::installiib {$version:
    file_name       => $file_name,
    source_location => $source_location,
    version         => $version,
  }

  -> iib_instance { $version:
    ensure         => 'present',
    os_user        => 'iibadmin',
    home_directory => "/opt/IBM/ace-${version}",
  }

}
