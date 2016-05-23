# Class: ssh::params
#
# This class holds parameters that need to be
# accessed by other classes.
class ssh::params {
  case $::osfamily {
    'RedHat': {
      $package_name         = 'openssh-server'
      $client_package_name  = 'openssh-clients'
      $service_name         = 'sshd'
      $sftp_path            = '/usr/libexec/openssh/sftp-server'
    }
    'Debian': {
      $package_name         = 'openssh-server'
      $client_package_name  = 'openssh-client'
      $service_name         = 'ssh'
      $sftp_path            = '/usr/lib/openssh/sftp-server'
    }
    'Suse': {
      $package_name         = 'openssh'
      $client_package_name  = 'openssh'
      $service_name         = 'sshd'
      $sftp_path            = '/usr/lib/ssh/sftp-server'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} The 'ssh' module only supports osfamily Debian, RedHat or SUSE (slaves only).")
    }
  }
}
