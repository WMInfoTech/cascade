# == Class: cascade
#
# Full description of class cascade here.
# This module manages the tomcat settings for Hannon Hills Cascade server
# All files in the files area are coped to tomcat's conf directory
# The only file actively managed is the context.xml, which contains these
# parameters.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class cascade (
  $db_user            = $cascade::params::db_user,
  $db_password        = $cascade::params::db_password,
  $db_url             = $cascade::params::db_url,
  $db_maxactive       = $cascade::params::db_maxactive,
  $db_maxidle         = $cascade::params::db_maxidle,
  $db_maxwait         = $cascade::params::db_maxwait,
  $db_removeabandoned = $cascade::params::db_removeabandoned,
  $db_logabandoned    = $cascade::params::db_logabandoned,
  $db_validationquery = $cascade::params::db_validationquery,
  $db_testonborrow    = $cascade::params::db_testonborrow,
  $tomcat_confdir     = $cascade::params::tomcat_confdir,
) inherits cascade::params {

  # validate parameters here
  validate_string($tomcat_pkg)
  validate_string($db_user, $db_password, $db_url, $db_maxactive, $db_maxidle, $db_maxwait)
  validate_string($db_removeabandoned, $db_logabandoned, $db_validationquery, $db_testonborrow)

  class { 'cascade::config': } ~>
  Class['cascade']
}
