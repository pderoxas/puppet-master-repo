class sdk ($sdk_platform, $sdk_version, $sdk_root_dir) {
  notify {"GEO Location=${::geo_location}, Store Number=${::store_number}, SDK Platform: $sdk_platform, SDK Version: $sdk_version, SDK Root Dir: $sdk_root_dir":
    withpath => true,
  }


  #base directory of sdk
  file { "basedir":
    ensure  => "directory",
    path    => $sdk_root_dir,
    recurse => true,
    purge   => true,
  }

  case $sdk_platform {
      java:     { include sdk::java }
      dotnet:   { include sdk::dotnet }
  }

  case $operatingsystem {
      centos, redhat, debian, ubuntu: { include sdk::linux }
      windows: { include sdk::windows }
  }


}

