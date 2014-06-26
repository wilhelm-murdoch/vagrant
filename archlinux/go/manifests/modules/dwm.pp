class puppet-archlinux-go::dwm {
  $packages = [
    "base-devel",
    "dmenu",
    "dwm",
  ]

  package {
    $packages:
  }

  file { "set_default_wm":
    ensure  => present,
    path    => "/home/vagrant/.xinitrc",
    content => "exec dwm",
  }
}
