class i3 {
  $packages = [
    "i3-wm",
    "i3lock",
    "i3status",
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
}
