# == Class logforward::params
#
# This class is meant to be called from logforward.
# It sets variables according to platform.
#
class logforward::params {
  $package_name   = 'logstash-forwarder'
  $package_ensure = 'present'

  $service_name   = 'logstash-forwarder'
  $service_ensure = 'running'

  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
