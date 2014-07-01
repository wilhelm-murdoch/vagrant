class locale {
  file { "replace-locale-gen-file":
  	path    => "/etc/locale.gen",
    ensure  => present,
    source  => "/etc/puppet/files/locale.gen",
  }

  exec { "update-locale":
  	command => "locale-gen",
  	require  => File["replace-locale-gen-file"],
  }
}