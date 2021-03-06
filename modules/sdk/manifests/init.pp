class sdk ($sdk_platform, $sdk_version, $sdk_root_dir) {
  notify {"GEO Location=${::geo_location}, 
           Store Number=${::store_number}, 
           SDK Platform: $sdk_platform, 
           SDK Version: $sdk_version, 
           SDK Root Dir: $sdk_root_dir":
    withpath => true,
  }

  #determine which class to include and which repo to source from
  case $sdk_platform {
      java:     { 
                  include sdk::java 
                  $sdk_repo = "java_repo"
                }
      dotnet:   { 
                  include sdk::dotnet
                  $sdk_repo = "dotnet_repo" 
                }
      default:  { $sdk_repo = "" }
  }

  #determine which class to include
  case $operatingsystem {
      centos, redhat, debian, ubuntu: { include sdk::linux }
      windows: { include sdk::windows }
  }

  #base directory
  file { "basedir":
    ensure  => "directory",
    path    => $sdk_root_dir,
    recurse => true,
    purge   => true,
    force   => true,
  }
  
  #copy the contents of the specific version of the sdk directory
  file { "sdkdir":
    ensure  => "directory",
    path    => "$sdk_root_dir/sdk",
    source  => "puppet:///$sdk_repo/$sdk_version",
    source_permissions => "ignore",
    recurse => true,
    purge   => true,
    force   => true,
    require => File['basedir'],
  }

  #sdk version info file
  file { "versionfile":
    ensure   => "file",
    content  => "This is some meta data about the SDK",
    path     => "$sdk_root_dir/sdk/$sdk_version.txt",
    source_permissions => "ignore",
    require  => File['sdkdir'],
  }






}
