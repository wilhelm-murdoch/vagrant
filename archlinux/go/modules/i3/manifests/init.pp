class i3 {
  $packages = [
    "i3-wm",
    "i3lock",
    "i3status",
    "conky",
    "dmenu",
  ]

  package {
    $packages:
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

  file { "/home/vagrant/.i3/conky.sh":
    ensure  => present,
    source  => "/etc/puppet/files/.i3/conky.sh",
    require => File["create-i3-config-directory"],
  }

  file { "/home/vagrant/.i3/conkyrc":
    ensure  => present,
    source  => "/etc/puppet/files/.i3/conkyrc",
    require => File["create-i3-config-directory"],
  }
}
