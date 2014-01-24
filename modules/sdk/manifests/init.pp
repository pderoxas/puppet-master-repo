class sdk ($sdk_platform, $sdk_version, $sdk_root_dir) {
  notify {"GEO Location=${::geo_location}, Store Number=${::store_number}, Group Name: ${::group_name}, SDK Platform: $sdk_platform, SDK Version: $sdk_version, SDK Root Dir: $sdk_root_dir":
    withpath => true,
  }

  include sdk::base

  case $sdk_platform {
      java:     { include sdk::java }
      dotnet:   { include sdk::dotnet }
      default:  { $sdk_repo = "" }
  }

  case $operatingsystem {
      centos, redhat, debian, ubuntu: { include sdk::linux }
      windows: { include sdk::windows }
  }

}
