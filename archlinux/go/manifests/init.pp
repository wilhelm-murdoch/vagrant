node default {
  Package {
    ensure => installed
  }

  Exec {
    path => "/usr/bin"
  }

  $packages = [
    "alsa-utils",
    "xorg-server",
    "xorg-server-utils",
    "xorg-xinit",
    "virtualbox-guest-utils",
    "xorg-twm",
    "xorg-xclock",
    "xterm",
    "ttf-inconsolata",
    "chromium",
  ]

  exec { "update-repositories":
    command  => "pacman -Su --noconfirm",
  } 

  exec { "update-system":
    command  => "pacman -Sy --noconfirm",
  }

  package { $packages:
    require => [
      Exec["update-system"], 
      Exec["update-repositories"]
    ]
  }

  exec { "setup-virtualbox-guest-utils":
    command => "modprobe -a vboxguest vboxsf",
    require => Package["virtualbox-guest-utils"]
  }

  file { "cleanup-home":
    path    => "/home/terry",
    ensure  => absent,
    recurse => true,
    force   => true,
  }

  include fish
  include dwm
  include golang
}
