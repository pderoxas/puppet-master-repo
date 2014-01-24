class sdk::java {
  #any java specific implementation can go here...

  $openIdService.baseURI = hiera('openIdService.baseURI')
  $openIdService.refreshToken = hiera('openIdService.refreshToken')
  $openIdService.clientID = hiera('openIdService.clientID')
  $openIdService.clientSecret = hiera('openIdService.clientSecret')
  $locationService.baseURI = hiera('locationService.baseURI')
  $location.id = hiera('location.id')

  file { "SystemClient.properties":
        path    => "$sdk::sdk_root_dir/sdk/SystemClient.properties",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',        
        content => template('sdk/ServiceClient.properties.erb'),
        require => File['sdkdir'],
  }

}
