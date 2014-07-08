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

  package { $packages: }

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
