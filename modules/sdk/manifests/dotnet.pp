class sdk::dotnet {
  #any .NET specific implementation can go here...

  file { "Config.xml":
        path    => "$sdk::sdk_root_dir/sdk/Config.xml",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',        
        content => template('sdk/Config.xml.erb'),
        require => File['sdkdir'],
  }
}
