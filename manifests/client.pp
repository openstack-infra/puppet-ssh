# Class: ssh::client
#
# configure the ssh client
class ssh::client($ssh_client_loglevel = 'QUIET') {
    include ::ssh::params
    package { $::ssh::params::client_package_name:
        ensure => present,
    }
    file { '/etc/ssh/ssh_config':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0444',
        content => template('ssh/ssh_config.erb'),
        replace => true,
    }
}
