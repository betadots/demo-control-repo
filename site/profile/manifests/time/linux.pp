# class profile::time::linux
# @summary This class manages ntp on linux
# @param servers optional array of time servers, uses class default if not set
#
class profile::time::linux (
  Optional[Array[String[1]]] $servers = undef,
) {
  case $facts['os']['name'] {
    'Debian', 'Ubuntu': {
      class { 'ntp':
        servers => $servers,
      }
    }
    'RedHat', 'CentOS': {
      if versioncmp($facts['os']['release']['major']) < '8' {
        class { 'ntp':
          servers => $servers,
        }
      } else {
        class { 'chrony':
          servers => $servers,
        }
      }
    }
    'SLES': {
      if versioncmp($facts['os']['release']['major'] < 15 ) {
        class { 'ntp':
          servers => $servers,
        }
      } else {
        class { 'systemd::timesyncd':
          ntp_server => $servers,
        }
      }
    }
    default: {
      fail("The OS ${facts['os']['name']} is not supported in class ${name}.")
    }
  }
}
