class fish {
  package { "fish":
    ensure => installed
  }

  exec { "set_default_shell":
    command => "chsh -s /usr/bin/fish vagrant",
    require => Package["fish"],
  }

  file { "/home/vagrant/.Xdefaults":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/.Xdefaults",
  }

  file { "/home/vagrant/.config/fish/config.fish":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/config.fish",
  }

  file { "/home/vagrant/.config/fish/prompt.fish":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/prompt.fish",
  }
}