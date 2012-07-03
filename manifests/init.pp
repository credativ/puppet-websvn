class websvn {

    Class['apache'] -> Class['websvn']

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

    file { '/etc/apache2/conf.d/websvn':
        ensure  => link,
        target  => '/etc/websvn/apache.conf',
        require => Package['websvn']
    }

}
