# == Class logforward::install
#
# This class is called from logforward for install.
#
class logforward::install {

  package { $::logforward::package_name:
    ensure => present,
  }
}
