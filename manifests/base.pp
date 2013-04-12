stage { init: before => Stage['main'], }

class dependencies {
    notify {"whats up homie":}
    class { apt::update: }

    # this installs php5 with apache :(
    # class { 'php':
    #     require => Class[apt::update:]
    # }
}

class {'dependencies': stage => init}

$packages = [
    "php5-cgi",
    "php5-cli",
    "nginx",
    "mysql-server",
    "php5-mysql"
]

package { $packages: ensure => latest, }
