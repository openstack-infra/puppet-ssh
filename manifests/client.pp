# Class: ssh::client
#
# configure the ssh client
#
# NOTE: "host_pattern_store_known_hosts" should be a standard host pattern
# understood by ssh_config, see man ssh_config(5) for more information
class ssh::client(
    $host_pattern_store_known_hosts = '*.openstack.org',
    $ssh_client_loglevel = 'QUIET',
) {
    include ::ssh::params
    if !defined(Package[$::ssh::params::client_package_name]) {
        package { $::ssh::params::client_package_name:
            ensure => present,
        }
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
