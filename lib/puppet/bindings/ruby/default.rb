Puppet::Bindings.newbindings('ruby::default') do
  bind {
    name         'ruby'
    to           'function'
    in_multibind 'puppet::module_data'
  }
end
