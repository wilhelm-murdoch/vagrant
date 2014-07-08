class chromium {
  $packages = [
    "chromium"
  ]

  package { $packages: }

  exec { "install-chromium-flash-plugin":
  	command => "yaourt -S chromium-pepper-flash --noconfirm",
    require => Package["chromium"],
  }
}
