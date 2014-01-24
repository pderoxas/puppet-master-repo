class sdk::linux {
  
  #kill the crond process
  exec { 'kill-crond':
    command    => "/bin/kill -9 $(pidof crond)",
    before     => File['basedir'],
  }

  #start crond after the files have been updated
  service { 'crond':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => File['basedir'],
  }

}
