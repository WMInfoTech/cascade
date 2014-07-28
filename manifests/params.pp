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
  $db_removeabandondedtimeout = '300'
  $db_logabandoned            = 'true'
  $db_validationquery         = 'SELECT 1'
  $dv_testonborrow            = 'true'
  if $::osfamily    == 'Debian' {
    $tomcat_confdir           = '/etc/tomcat7'  }
  elsif $::osfamily == 'RedHat' {
    $tomcat_confdir           = '/etc/tomcat6'
  }  else {
    fail('Your operating system isn\'t supported by this tomcat module.')
  }
}
