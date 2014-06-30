# need dis: https://github.com/fatih/vim-go

class packages {
  @package { [
    "curl",
    "git",
  ]: }
}

class golang {
  include packages

  realize [
    Package["curl"],
    Package["git"],
  ]

  $packages = [
    "go",
    "godep",
    "mercurial",
    "bzr",
  ]

  package { $packages: }

  file { [
      "/home/vagrant/go",
      "/home/vagrant/go/src",
      "/home/vagrant/go/bin",
      "/home/vagrant/go/pkg",
    ]:
    ensure  => directory,
    group   => "vagrant",
    owner   => "vagrant",
    require => Package["go"],
  }
}
