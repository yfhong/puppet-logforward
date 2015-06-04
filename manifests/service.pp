# == Class logforward::service
#
# This class is meant to be called from logforward.
# It ensure the service is running.
#
class logforward::service {

  service { $::logforward::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
