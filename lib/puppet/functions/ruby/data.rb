Puppet::Functions.create_function(:'ruby::data') do
  def data
    prefix = closure_scope.lookupvar('::boxen::config::home')
    user = closure_scope.lookupvar('::boxen_user')
    {
      'ruby::prefix' => prefix,
      'ruby::user' => user,
      'ruby::provider' => 'rbenv',

      'ruby::build::ensure' => 'v20150413',
      'ruby::build::prefix' => "#{prefix}/ruby-build",
      'ruby::build::user' => user,

      'ruby::rbenv::ensure' => 'v0.4.0',
      'ruby::rbenv::prefix' => "#{prefix}/rbenv",
      'ruby::rbenv::user' => user,

      'ruby::chruby::ensure' => 'v0.3.8',
      'ruby::chruby::prefix' => "#{prefix}/chruby",
      'ruby::chruby::user' => user,
      'ruby::chruby::auto_switch' => true,

      'ruby::version::alias' => {
        '1.8.7' => '1.8.7-p375',
        '1.9.2' => '1.9.2-p320',
        '1.9.3' => '1.9.3-p545',
        '1.9.3-p231-tcs-github' => '1.9.3-p231-tcs-github-1.0.32',
        '2.0.0' => '2.0.0-p451',
        '2.0.0-github' => '2.0.0-github6',
        '2.1.0-github' => '2.1.0-github1',
        '2.1.2-github' => '2.1.2-github1',
        '2.1.4-github' => '2.1.4-github1',
        '2.1.5-github' => '2.1.5-github1',
        '2.1.6-github' => '2.1.6-github1',
        '2.1-github' => '2.1.5-github1',
        'jruby' => 'jruby-1.7.6',
        'ree' => 'ree-1.8.7-2012.02'
      },

      'ruby::version::env' =>   {
        'Darwin' => {
          'BOXEN_S3_HOST' => closure_scope.lookupvar('::boxen_s3_host'),
          'BOXEN_S3_BUCKET' => closure_scope.lookupvar('::boxen_s3_bucket'),
          'CFLAGS' => "-I#{closure_scope.lookupvar('::homebrew::config::installdir')}/include -march=core2 -O3",
          'LDFLAGS' => "-L#{closure_scope.lookupvar('::homebrew::config::installdir')}/lib",
          'RUBY_CONFIGURE_OPTS' => "--without-gmp --with-readline-dir=#{closure_scope.lookupvar('::homebrew::config::installdir')}/opt/readline"
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
  end
end
