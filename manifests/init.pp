# == Class: ssh
#
class ssh ($trusted_ssh_source = 'puppetmaster.openstack.org') {
    include ::ssh::server
    ::ssh::server {
        trusted_ssh_source => $trusted_ssh_source,
    }
}
