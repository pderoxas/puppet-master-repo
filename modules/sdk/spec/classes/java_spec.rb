require 'spec_helper'

describe 'sdk::java' do

  #set mock values for parameters
  let(:params) { {:java_sdk_version => 'v1.0.0'} }
  
  it do
    should contain_file('javasdkdir').with({
      'ensure'  => 'directory',
      'path'    => '/paypal/sdk',
    })
    
    should contain_file('java_sdk_version_file').with({
      'ensure'  => 'file',
      'path'    => '/paypal/sdk/v1.0.0.txt',
    })
  end

end
