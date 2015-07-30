# == Class logforward::config
#
# This class is called from logforward for service config.
#
class logforward::config {

  $aggregated_logs = hiera_array('logforward::aggregated_logs', false)
  $ssl_cert_path = "${::logforward::confdir}/${::logforward::ssl_cert}"
  $ssl_key_path = "${::logforward::params::confdir}/${::logforward::ssl_key}"
  $log_server_host = $::logforward::log_server_host
  $log_server_port = $::logforward::log_server_port

  file { $::logforward::confdir:
    ensure => 'directory',
    owner  => 'root',
    group  => $::logforward::params::root_group,
    mode   => '0755',
  }

  file { $::logforward::conffile:
    ensure  => 'present',
    owner   => 'root',
    group   => $::logforward::params::root_group,
    mode    => '0640',
    content => template('logforward/logstash-forwarder.conf.erb'),
  }

  file { $::logforward::ssl_cert:
    path   => "${::logforward::confdir}/${::logforward::ssl_cert}",
    ensure => 'present',
    owner  => 'root',
    group  => $::logforward::params::root_group,
    mode   => '0644',
    source => "puppet:///modules/logforward/${::logforward::ssl_cert}",
  }

  file { $::logforward::ssl_key:
    path   => "${::logforward::confdir}/${::logforward::ssl_key}",
    ensure => 'present',
    owner  => 'root',
    group  => $::logforward::params::root_group,
    mode   => '0400',
    source => "puppet:///modules/logforward/${::logforward::ssl_key}",
  }
}
