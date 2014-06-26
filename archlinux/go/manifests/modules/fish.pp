class puppet-archlinux-go::fish {
  package { "fish":
    ensure => installed
  }

  exec { "set_default_shell":
    command => "chsh -s /usr/bin/fish vagrant",
    require => Package["fish"],
  }
}
