class sdk::base {
  #base functionality

  $openIdServiceBaseURI = hiera('openIdService.baseURI', "")
  $openIdServiceRefreshToken = hiera('openIdService.refreshToken', "")
  $openIdServiceClientID = hiera('openIdService.clientID', "")
  $openIdServiceClientSecret = hiera('openIdService.clientSecret', "")
  $locationServiceBaseURI = hiera('locationService.baseURI', "")
  $locationId = hiera('location.id', "")

  #base directory of sdk
  file { "basedir":
    ensure  => "directory",
    path    => $sdk::sdk_root_dir,
    recurse => true,
    purge   => true,
  }


  #sdk version info file
  file { "versionfile":
    ensure   => "file",
    content  => "This is some meta data about the SDK",
    path     => "$sdk::sdk_root_dir/sdk/$sdk::sdk_version.txt",
    source_permissions => "ignore",
    require  => File['sdkdir'],
  }


  case $sdk_platform {
      java:     { 
                  $sdk_repo = "java_repo"
                }
      dotnet:   { 
                  $sdk_repo = "dotnet_repo" 
                }
      default:  { $sdk_repo = "" }
  }

  file { "sdkdir":
    ensure  => "directory",
    path    => "$sdk_root_dir/sdk",
    source  => "puppet:///$sdk_repo/$sdk::sdk_version",
    source_permissions => "ignore",
    recurse => true,
    purge   => true,
    require => File['basedir'],
  }

}
