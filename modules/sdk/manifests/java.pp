class sdk::java {


  #binary file
  file { "javasdkdir":
    ensure  => "directory",
    path    => "$sdk::sdk_root_dir/sdk",
    source  => "puppet:///java_sdk_repo/$sdk::sdk_version",
    source_permissions => "ignore",
    recurse => true,
    purge   => true,
    require => File['basedir'],
  }

  #sdk version info file
  file { "java_sdk_version_file":
    ensure   => "file",
    content  => "This is the readme file",
    path     => "$sdk::sdk_root_dir/sdk/$sdk::sdk_version.txt",
    source_permissions => "ignore",
    require  => File['javasdkdir'],
  }
}
