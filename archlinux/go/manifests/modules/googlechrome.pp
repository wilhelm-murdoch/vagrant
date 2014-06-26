class puppet-archlinux-go::googlechrome {
  package { "google-chrome":
    ensure  => present,
  }

  package { "ttf-google-fonts-git":
    ensure => present,
  }
}
