class dwm {
  $packages = [
    "base-devel",
    "dmenu",
    "dwm",
  ]

  package {
    $packages:
  }

  file { "set-default-window-manager":
    ensure  => present,
    path    => "/home/vagrant/.xinitrc",
    content => "exec dwm",
  }
}
