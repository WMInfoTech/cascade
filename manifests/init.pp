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
# cascade_user = user than owns the files installed, defaults to tomcat7 on ubuntu, tomcat on rhel
# cascade_group = group that owns the files installed, ditto above defaults
# db_user - userid to connect to MySQL db with - no default
# db_password - password used to connect to MySQL with - no default
# db_url - url to find MySQL with - no default
# db_maxactive - defined in context.xml, deault = 50
# db_maxidle - context.xml, default = 10
# db_maxwait - context.xml, default = 3000
# db_removeabandoned - context.xml, default = true
# db_logabandoned - context.xml, default = true
# db_validationquery - context.xml, default = SELECT 11
# db_testonborrow - context.xml, default = true
# tomcat_confdir - location of tomcat confiiguration dir, ubuntu=/etc/tomcat7, rhel = /etc/tomcat
#
class cascade (
  $cascade_user       = $cascade::params::cascade_user,
  $cascade_group      = $cascade::params::cascade_group,
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
  validate_string($tomcat_confdir)
  validate_string($db_user, $db_password, $db_url, $db_maxactive, $db_maxidle, $db_maxwait)
  validate_string($db_removeabandoned, $db_logabandoned, $db_validationquery, $db_testonborrow)

  class { 'cascade::config': } ~>
  Class['cascade']
}
