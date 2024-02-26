# This resource installs a package called flask

package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
