#!/usr/bin/env bash
# Set up a new Ubuntu server with Nginx

# Update system
exec { 'update system':
    command => '/usr/bin/apt-get update',
}

# Install Nginx
package { 'nginx':
    ensure  => 'installed',
    require => Exec['update system']
}

# Create a new index page
file { '/var/www/html/index.html':
    content => 'Hello World!'
}

# Set up /redirect_me to a YouTube video
exec { 'redirect_me':
    command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
    provider => 'shell',
    require  => Package['nginx']
}

# Start Nginx service
service { 'nginx':
    ensure => running,
    require => Package['nginx']
}
