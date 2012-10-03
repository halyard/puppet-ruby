class ruby::1-8-7-p358 {
  if $::macosx_productversion_major == 10.8 {
    $opts = '--disable-tk --disable-tcl --disable-tcltk-framework'
  } else {
    $opts = undef
  }

  ruby { '1.8.7-p358':
    cc        => '/usr/local/bin/gcc-4.2',
    conf_opts => $opts,
    require   => Package['github/brews/apple-gcc42']
  }
}