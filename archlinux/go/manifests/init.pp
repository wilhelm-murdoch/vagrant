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

  package {
    $packages:
  }

  exec { "update_pacman_repositories":
    command => "pacman -Su"
  }

  exec { "update_archlinux":
    command => "pacman -Sy"
  }

  exec { "setup_vbox_extensions":
    command => "modprobe -a vboxguest vboxsf"
  }

  file { "cleanup_home":
    path    => "/home/terry",
    ensure  => absent,
    recurse => true,
    force   => true,
  }

  include fish
  include dwm
  include golang
}
