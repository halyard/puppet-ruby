function ruby::data {
  $prefix = $::boxen::config::home
  $user = $::boxen_user
  $result = {
    'ruby::prefix' => $prefix,
    'ruby::user' => $user,
    'ruby::provider' => 'rbenv',

    'ruby::build::ensure' => 'v20150413',
    'ruby::build::prefix' => "${prefix}/ruby-build",
    'ruby::build::user' => $user,

    'ruby::rbenv::ensure' => 'v0.4.0',
    'ruby::rbenv::prefix' => "${prefix}/rbenv",
    'ruby::rbenv::user' => $user,

    'ruby::chruby::ensure' => 'v0.3.8',
    'ruby::chruby::prefix' => "${prefix}/chruby",
    'ruby::chruby::user' => $user,
    'ruby::chruby::auto_switch' => true,

    'ruby::version::alias' => ruby::aliases(),

    'ruby::version::env' => ruby::environment()
  }
}

