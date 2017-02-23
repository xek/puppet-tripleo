# == Class: tripleo::profile::base::tuned
#
# Configures tuned service.
#
# === Parameters:
#
# [*profile*]
#   (optional) tuned active profile.
#   Defaults to 'throughput-performance'
#
#
class tripleo::profile::base::tuned (
  $profile = 'throughput-performance'
) {
  exec { 'tuned-adm':
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    command => "tuned-adm profile ${profile}",
    unless  => "tuned-adm active | grep -q '${profile}'"
  }
}
