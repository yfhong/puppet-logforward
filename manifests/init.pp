# == Class: logforward
#
# Full description of class logforward here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class logforward (
  $package_name   = $::logforward::params::package_name,
  $package_ensure = $::logforward::params::package_ensure,
  $service_name   = $::logforward::params::service_name,
  $service_ensure = $::logforward::params::service_ensure,
  $confdir        = $::logforward::params::confdir,
  $conffile       = $::logforward::params::conffile,
  $ssl_cert       = $::logforward::params::ssl_cert,
  $ssl_key        = $::logforward::params::ssl_key,
  $package_from_provider,
) inherits ::logforward::params {

  # validate parameters here

  class { '::logforward::install': } ->
  class { '::logforward::config': } ~>
  class { '::logforward::service': } ->
  Class['::logforward']
}
