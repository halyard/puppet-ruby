puppet-ruby
===========

[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/circleci/project/halyard/puppet-ruby.svg)](https://circleci.com/gh/halyard/puppet-ruby)

Module to install ruby versions and gems

## Changes from upstream

* Removed a lot of meta-stuff I wasn't using, like the cardboard scripts
* Removed definition files for github's custom ruby versions
* Set up CircleCI build tests

## Usage

In your hiera config:

```
ruby::build::ensure: v20150818
ruby::rbenv::ensure: v0.4.0

"ruby::provider": "rbenv"
"ruby::user": "deployuser"

# Check https://github.com/sstephenson/ruby-build/releases for ruby-build releases
"ruby::build::ensure": "v20141028"
"ruby::chruby::ensure": "v0.3.6"
"ruby::rbenv::ensure": "v0.4.0"

# rbenv plugins
"ruby::rbenv::plugins":
  "rbenv-gem-rehash":
    "ensure": "v1.0.0"
    "source": "sstephenson/rbenv-gem-rehash"

# Environment variables for building specific versions
# You'll want to enable hiera's "deeper" merge strategy
# See http://docs.puppetlabs.com/hiera/1/configuring.html#mergebehavior
"ruby::version::env":
  "1.9.3-gentoo":
    "CC": "llvm"
    "CFLAGS": "-O9 -funroll-loops"
  "2.0.0-p0":
    "CC": "gcc"

# Version aliases, commonly used to bless a specific version
# Use the "deeper" merge strategy, as with ruby::version::env
"ruby::version::alias":
  "1.9.3": "1.9.3-p484"
  "2.0.0": "2.0.0-github"
  "2.0.0-github": "2.0.0-github6"
```

```puppet
class { 'ruby::global':
  version => '2.2.2'
}

# ensure a gem is installed for a certain ruby version
# note, you can't have duplicate resource names so you have to name like so
$version = "2.2.2"
ruby_gem { "bundler for ${version}":
  gem          => 'bundler',
  version      => '~> 1.2.0',
  ruby_version => $version,
}

ruby_gem { 'bundler for all rubies':
  gem          => 'bundler',
  version      => '~> 1.0',
  ruby_version => '*',
}

# install a ruby version
ruby::version { '2.2.2': }

# Installing rbenv plugin
ruby::rbenv::plugin { 'rbenv-vars':
  ensure => 'v1.2.0',
  source  => 'sstephenson/rbenv-vars'
}
```

## Details

All ruby versions are installed to /opt/rubies, using either rbenv (default) or chruby.

## Required Puppet Modules

* [boxen](https://github.com/halyard/puppet-boxen)
* [repository](https://github.com/halyard/puppet-repository)

