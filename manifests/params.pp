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

  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default             => 'root',
  }

  $confdir = '/etc/logstash-forwarder.d'
  $conffile = '/etc/logstash-forwarder.conf'
  $ssl_cert = 'logstash-forwarder.crt'
  $ssl_key = 'logstash-forwarder.key'

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
