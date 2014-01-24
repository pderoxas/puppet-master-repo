require 'spec_helper'

describe 'sdk::dotnet' do

  #set mock values for parameters
  let(:params) { {:dotnet_sdk_version => 'v1.0.0'} }

  it do
    should contain_file('dotnetsdkdir').with({
      'ensure'  => 'directory',
      'path'    => '/paypal/sdk',
    })
    
    should contain_file('dotnet_sdk_version_file').with({
      'ensure'  => 'file',
      'path'    => '/paypal/sdk/v1.0.0.txt',
    })
  end

end
