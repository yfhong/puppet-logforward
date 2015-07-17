# == Class logforward::service
#
# This class is meant to be called from logforward.
# It ensure the service is running.
#
class logforward::service {

  service { 'logstash-forwarder':
    name       => $::logforward::service_name,
    ensure     => $::logforward::service_ensure,
    enable     => $::logforward::service_ensure ? {
      'running' => true,
      'stopped' => false,
    },
    hasstatus  => true,
    hasrestart => true,
  }
}
