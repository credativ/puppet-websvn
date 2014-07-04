class websvn {

    # only configures websvn for apache2 at the moment
    package { 'apache2':
        ensure => present
    }

    package { 'websvn':
        ensure => present
    }

    file { '/etc/websvn/svn_deb_conf.inc':
        source  => 'puppet:///modules/websvn/svn_deb_conf.inc',
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        require => Package['websvn']
    }

    # FIXME: uses resources form apache puppet module?
    # must be done careful, though
    file { '/etc/apache2/conf.d/websvn':
        ensure  => link,
        target  => '/etc/websvn/apache.conf',
        require => [ Package['apache2'], Package['websvn'] ]
    }

}
