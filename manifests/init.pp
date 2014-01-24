
  class {'sdk' :
          sdk_platform => hiera('platform'),
          sdk_version => hiera('version'),
          sdk_root_dir => hiera('rootDir'),
        }







