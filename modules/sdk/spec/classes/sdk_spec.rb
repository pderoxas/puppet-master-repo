require 'spec_helper'

describe 'sdk' do
  #set mock values for parameters
  let(:params) { {:sdk_platform => 'java', :sdk_version => 'v1.0.0'} }

  #make sure it creates the base directory
  it do
    should contain_file('basedir').with({
      'ensure'  => 'directory',
      'path'    => '/paypal',
      'owner'   => 'root',
      'group'   => 'root',
      'recurse' => true,
      'purge'   => true,
    })
  end

end
