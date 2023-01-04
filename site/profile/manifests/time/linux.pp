# class profile::time::linux
# @summary This class manages ntp on linux
# @param servers optional array of time servers, uses class default if not set
#
class profile::time::linux (
  Optional[Array[String[1]]] $servers = undef,
){
  class { 'ntp':
    servers =>  $servers,
  }
}
