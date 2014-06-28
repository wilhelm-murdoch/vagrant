class chromium {
  $packages = [
    "chromium"
  ]

  package { $packages:
    require => [
      Exec["update-system"], 
      Exec["update-repositories"],
    ],
  }

  exec { "install-chromium-flash-plugin":
  	command => "yaourt -S chromium-pepper-flash --noconfirm"
  }
}