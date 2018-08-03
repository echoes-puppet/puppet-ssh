class ssh::params {
  $permit_root_login = false
  $port              = 22
  # how it is done in puppet 4 and newer
  #case $facts['os']['family'] {
  # how it is done in puppet 3 and older
  #case $::osfamily {
  case $facts['operatingsystem'] {
    'Debian', 'Ubuntu': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }
    # regex match
    /^RedHat|CentOS/: {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
      notify { "${0} is our operating system!": }
    }
    'default': {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }
}
  # using equality operator ==
#  if $facts['os']['family'] == 'Debian' {
#    $package_name = 'openssh-server'
#    $service_name = 'ssh'
#  }
#  elsif $facts['os']['family'] == 'RedHat' {
#    $package_name = 'openssh-server'
#    $service_name = 'sshd'
#  }
#  else {
#    fail("${facts['operatingsystem']} is not supported!")
#  }
#}
