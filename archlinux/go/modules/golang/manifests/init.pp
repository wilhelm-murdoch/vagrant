class golang {
  $packages = [
    "go",
    "godep",
    "git",
    "mercurial",
    "bzr",
    "curl",
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