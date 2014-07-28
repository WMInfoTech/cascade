# == Class cascade::params
#
# This class is meant to be called from cascade
# It sets variables according to platform
#
class cascade::params {
  $db_maxactive               = '50'
  $db_maxidle                 = '10'
  $db_maxwait                 = '3000'
  $db_removeabandoned         = 'true'
  $db_removeabandonedtimeout  = '300'
  $db_logabandoned            = 'true'
  $db_validationquery         = 'SELECT 1'
  $db_testonborrow            = 'true'
  if $::osfamily    == 'Debian' {
    $cascade_user             = 'tomcat7'
    $cascade_group            = 'tomcat7'
    $tomcat_confdir           = '/etc/tomcat7'  }
  elsif $::osfamily == 'RedHat' {
    $cascade_user             = 'tomcat'
    $cascade_group            = 'tomcat'
    $tomcat_confdir           = '/etc/tomcat6'
  }  else {
    fail('Your operating system isn\'t supported by this tomcat module.')
  }
}
