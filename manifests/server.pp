# Class: ssh::server
#
# configure the ssh server
class ssh::server($trusted_ssh_source = 'puppetmaster.openstack.org') {
    include ::ssh::params
    if !defined(Package[$::ssh::params::package_name]) {
        package { $::ssh::params::package_name:
            ensure => present,
        }
    }
    if ($::in_chroot) {
        notify { 'sshd in chroot':
            message => 'sshd not refreshed, running in chroot',
        }
    } else {
        service { $::ssh::params::service_name:
            ensure     => running,
            hasrestart => true,
            subscribe  => File['/etc/ssh/sshd_config'],
        }
    }
    file { '/etc/ssh/sshd_config':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0444',
        content => template('ssh/sshd_config.erb'),
        replace => true,
    }
}
