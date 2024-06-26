# Execute pkill command to terminate the process named killmenow
exec { 'killmenow':
  command => 'pkill -9 -f killmenow',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  onlyif  => 'pgrep -f killmenow',
}
