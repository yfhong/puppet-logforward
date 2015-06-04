# == Class logforward::install
#
# This class is called from logforward for install.
#
class logforward::install {

  file { $::logforward::package_name:
    path   => "/tmp/${::logforward::package_name}.rpm",
    source => "puppet:///modules/logforward/${::logforward::package_from_provider}",
  }

  package { $::logforward::package_name:
    ensure   => present,
    provider => 'rpm',
    source   => "/tmp/${::logforward::package_name}.rpm",
    require  => File[$::logforward::package_name],
  }
}
