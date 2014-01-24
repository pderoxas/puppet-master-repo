class sdk::windows {

  exec { 'stop-application':
     command   => '$(Stop-Process -name "SamplePOS")',
     unless    => 'if (Stop-Process -name "SamplePOS") { exit 1 }',
     provider  => powershell,
     before    => File['basedir']
  }

  exec { 'start-application':
     command   => '$(Start-Process -FilePath C:\paypal\sdk\SamplePOS.EXE)',
     provider  => powershell,
     require   => File['basedir']
  }


}
