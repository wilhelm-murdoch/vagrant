class fish {
  package { "fish":
    ensure => installed
  }

  exec { "set-default-shell":
    command => "chsh -s /usr/bin/fish vagrant",
    require => Package["fish"],
  }

  file { "/home/vagrant/.Xdefaults":
    ensure => present,
    source => "/etc/puppet/files/.Xdefaults",
  }

  file { "create-fish-config-directory":
    path    => "/home/vagrant/.config/fish",
    ensure  => directory,
    recurse => true,
    owner   => "vagrant",
    group   => "vagrant",
  }

  file { "/home/vagrant/.config/fish/config.fish":
    ensure  => present,
    source  => "/etc/puppet/files/config.fish",
    require => File["create-fish-config-directory"]
  }

  file { "/home/vagrant/.config/fish/prompt.fish":
    ensure  => present,
    source  => "/etc/puppet/files/prompt.fish",
    require => File["create-fish-config-directory"],
  }
}
