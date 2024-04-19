# Install puppet-lint package using gem provider
package { 'puppet-lint':
  ensure   => '2.5.0',
  provider => 'gem',
}
