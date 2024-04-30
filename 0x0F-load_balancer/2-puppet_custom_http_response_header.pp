# Setup New Ubuntu server with nginx
# and add a custom HTTP header

exec { 'update system':
    command => '/usr/bin/apt-get update',
}

package { 'nginx':
    ensure  => 'installed',
    require => Exec['update system'],
}

file { '/var/www/html/index.html':
    content => 'Hello World!',
}

file { '/etc/nginx/sites-available/default':
    ensure => present,
    content => template('nginx/default.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
}

service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
}
