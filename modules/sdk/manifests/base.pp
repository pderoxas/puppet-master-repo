class sdk::base {
  #base functionality

  $openIdServiceBaseURI = hiera('openIdService.baseURI', "")
  $openIdServiceRefreshToken = hiera('openIdService.refreshToken', "")
  $openIdServiceClientID = hiera('openIdService.clientID', "")
  $openIdServiceClientSecret = hiera('openIdService.clientSecret', "")
  $locationServiceBaseURI = hiera('locationService.baseURI', "")
  $locationId = hiera('location.id', "")



}
