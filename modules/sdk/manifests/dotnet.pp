class sdk::dotnet {
  #any .NET specific implementation can go here...

   $openIdServiceBaseURI = hiera('openIdService.baseURI', "")
   $hereAPIServiceBaseURI = hiera('hereAPIService.baseURI', "")
   $posAPIServiceBaseURI = hiera('posAPIService.baseURI', "")
   $ecAPIServiceBaseURI = hiera('ecAPIService.baseURI', "")
   $payerId = hiera('payerId', "")
   $locationId = hiera('locationId', "")
   $userId = hiera('userId', "")
   $password = hiera('password', "")
   $signature = hiera('signature', "")
   $password = hiera('password', "")
   $refreshToken = hiera('refreshToken', "")
   $clientSecret = hiera('clientSecret', "")


  file { "Config.xml":
        path    => "$sdk::sdk_root_dir/sdk/Config.xml",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',        
        content => template('sdk/Config.xml.erb'),
        require => File['sdkdir'],
  }
}
