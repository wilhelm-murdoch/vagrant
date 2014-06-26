class bootstrap {
  # $packages = [
  #   "alsa-utils",
  #   "xorg-server",
  #   "xorg-server-utils",
  #   "xorg-xinit",
  #   "virtualbox-guest-utils",
  #   "xorg-twm",
  #   "xorg-xclock",
  #   "xterm",
  #   "ttf-inconsolata",
  # ]

  # package {
  #   $packages:
  # }

  # exec { "setup_vbox_extensions":
  #   command => "modprobe -a vboxguest vboxsf"
  # }

  # file { "cleanup_home":
  #   path    => "/home/terry",
  #   ensure  => absent,
  #   recurse => true,
  #   force   => true,
  # }
}

class fish {
  package { "fish":
    ensure => installed
  }

  exec { "set_default_shell":
    command => "chsh -s /usr/bin/fish vagrant",
    require => Package["fish"],
  }

  file { "/home/vagrant/.Xdefaults":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/.Xdefaults",
  }

  file { "/home/vagrant/.config/fish/config.fish":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/config.fish",
  }

  file { "/home/vagrant/.config/fish/prompt.fish":
    ensure => present,
    owner  => "vagrant",
    group  => "vagrant",
    source => "/etc/puppet/files/prompt.fish",
  }
}

class go {

}

class chromium {
  exec { "install_google_chrome":
    command => "yaourt -S google-chrome ttf-google-fonts-git --noconfirm"
  }
}

class dwm {
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

class yaourt {
  file { "/etc/pacman.d/mirrorlist":
    owner => "vagrant",
    group => "vagrant",
  }

  file { "/etc/pacman.conf":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "/etc/puppet/files/pacman.conf",
  }

  file {"/etc/pacman.d/archlinuxfr.conf":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "/etc/puppet/files/archlinuxfr.conf",
    notify  => Exec["pacman_sync_yaourt"],
    require => File["/etc/pacman.conf"],
  }

  exec {"pacman_sync_yaourt":
    refreshonly => true,
    user        => "root",
    command     => "/usr/bin/pacman --noconfirm --sync --refresh yaourt",
    require     => File["/etc/pacman.d/archlinuxfr.conf"],
  }
}

node default {
  Package {
    ensure => installed
  }

  Exec {
    path => "/usr/bin"
  }

  # include bootstrap
  # include fish
  # include dwm
  include yaourt
  include googlechrome
  # include go
}
