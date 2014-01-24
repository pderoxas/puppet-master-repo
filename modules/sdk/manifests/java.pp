class sdk::java {
  #any java specific implementation can go here...

  $openIdServiceBaseURI = hiera('openIdService.baseURI', "")
  $openIdServiceRefreshToken = hiera('openIdService.refreshToken', "")
  $openIdServiceClientID = hiera('openIdService.clientID', "")
  $openIdServiceClientSecret = hiera('openIdService.clientSecret', "")
  $locationServiceBaseURI = hiera('locationService.baseURI', "")
  $locationId = hiera('location.id', "")

  file { "SystemClient.properties":
        path    => "$sdk::sdk_root_dir/sdk/SystemClient.properties",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',        
        content => template('sdk/ServiceClient.properties.erb'),
        require => File['sdkdir'],
  }

}
