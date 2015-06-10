function ruby::environment {
  {
    'Darwin' => {
      'BOXEN_S3_HOST' => $::boxen_s3_host,
      'BOXEN_S3_BUCKET' => $::boxen_s3_bucket,
      'CFLAGS' => "-I${::homebrew::config::installdir}/include -march=core2 -O3",
      'LDFLAGS' => "-L${::homebrew::config::installdir}/lib",
      'RUBY_CONFIGURE_OPTS' => "--without-gmp --with-readline-dir=${::homebrew::config::installdir}/opt/readline"
    },  
    '1.8.7-p375' => {
      'CC' => 'gcc-4.8',
      'RUBY_CONFIGURE_OPTS' => '--disable-tk --disable-tcl --disable-tcltk-framework'
    },  
    '1.9.2-p290' => {
      'CC' => 'gcc-4.2'
    },  
    '1.9.2-p320' => {
      'CC' => 'gcc-4.2'
    }   
  }
}
