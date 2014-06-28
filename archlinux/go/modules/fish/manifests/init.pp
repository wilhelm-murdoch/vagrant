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

  file { "/home/vagrant/.config/fish/config.fish":
    ensure => present,
    source => "/etc/puppet/files/config.fish",
  }

  file { "/home/vagrant/.config/fish/prompt.fish":
    ensure => present,
    source => "/etc/puppet/files/prompt.fish",
  }
}
