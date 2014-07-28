# == Class cascade::config
#
# This class is called from cascade
#
class cascade::config {

  file { "${cascade::tomcat_confdir}/cascade.policy":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/cascade.policy',
  }

  file { "${cascade::tomcat_confdir}/cascade.properties":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/cascade.properties',
  }

  file { "${cascade::tomcat_confdir}/ehcache.properties":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/ehcache.properties',
  }

  file { "${cascade::tomcat_confdir}/ehcache.xml":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/ehcache.xml',
  }

  file { "${cascade::tomcat_confdir}/logging.properties":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/logging.properties',
  }

  file { "${cascade::tomcat_confdir}/server.xml":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/server.xml',
  }

  file { "${cascade::tomcat_confdir}/web.xml":
    ensure  => present,
    owner   => $cascade::cascade_user,
    group   => $cascade::cascade_group,
    mode    => '0644',
    source  => 'cascade/web.xml',
  }


  file { "${cascade::tomcat_confdir}/context.xml":
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => $tomcat7::tomcat_group,
    content => template('cascade/context.xml.erb'),
  }

}
