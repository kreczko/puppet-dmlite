class dmlite::plugins::memcache(
  $servers          = $dmlite::plugins::memcache::params::servers,
  $enable_memcache  = $dmlite::plugins::memcache::params::enable_memcache,
  $pool_size        = $dmlite::plugins::memcache::params::pool_size,
  $user             = $dmlite::params::user,
  $group            = $dmlite::params::group,
  $protocol         = $dmlite::plugins::memcache::params::protocol,
  $posix            = $dmlite::plugins::memcache::params::posix,
  $expiration_limit = $dmlite::plugins::memcache::params::expiration_limit,
  $func_counter     = $dmlite::plugins::memcache::params::func_counter,
) inherits dmlite::plugins::memcache::params {

  Class[Dmlite::Plugins::Memcache::Install] -> Class[Dmlite::Plugins::Memcache::Config]

  class{"dmlite::plugins::memcache::config":
    servers          => $servers,
    enable_memcache  => $enable_memcache,
    pool_size        => "${pool_size}",
    user             => "${user}",
    group            => "${group}",
    protocol         => "${protocol}",
    posix            => "${posix}",
    expiration_limit => $expiration_limit,
    func_counter     => "${func_counter}",
  }
  class{"dmlite::plugins::memcache::install":}

}
