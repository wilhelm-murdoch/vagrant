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
    "xorg-twm",
    "xorg-xclock",
    "xterm",
    "ttf-inconsolata",
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

  file { "cleanup-home":
    path    => "/home/terry",
    ensure  => absent,
    recurse => true,
    force   => true,
  }

  include locale
  include chromium
  include fish
  include i3
  include golang
  include vim
}
