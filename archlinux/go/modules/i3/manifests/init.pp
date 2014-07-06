class i3 {
  $packages = [
    "i3-wm",
    "i3lock",
    "i3status",
    "upower",
    "dmenu",
    "feh",
  ]

  package {
    $packages:
  }

  exec { "install-i3blocks":
    command => "yaourt -S i3blocks --noconfirm"
  }

  file { "set-default-window-manager":
    ensure  => present,
    path    => "/home/vagrant/.xinitrc",
    content => "exec i3",
    owner   => "vagrant",
    group   => "vagrant",
  }

  file { "create-i3-config-directory":
    path    => "/home/vagrant/.i3",
    ensure  => directory,
    recurse => true,
    owner   => "vagrant",
    group   => "vagrant",
    require => Package["i3-wm"],
  }

  file { "/home/vagrant/.i3/config":
    ensure  => present,
    source  => "/etc/puppet/files/.i3/config",
    require => File["create-i3-config-directory"],
  }

  file { "/home/vagrant/.i3blocks.conf":
    ensure => present,
    source => "/etc/puppet/files/.i3blocks.conf",
    owner  => "vagrant",
    group  => "vagrant",
  }

  file { "/home/vagrant/.i3/i3blocks":
    ensure  => directory,
    recurse => true,
    source  => "/etc/puppet/files/i3blocks",
    require => File["create-i3-config-directory"],
  }
}
