class vim {
  $packages = [
    "curl",
    "git"
  ]

  package { $packages: }

  file { [ 
      "/home/vagrant/.vim", 
      "/home/vagrant/.vim/bundle", 
      "/home/vagrant/.vim/autoload", 
    ]:
    ensure  => directory,
    group   => "vagrant",
    owner   => "vagrant",
  }

  exec { "install-solarized-theme": 
    cwd     => "/home/vagrant/.vim/bundle",
    user    => "vagrant",
    command => "git clone https://github.com/altercation/vim-colors-solarized.git",
    require => [Package["git"], File["/home/vagrant/.vim/bundle"]],
  }

  exec { "install-pathogen":
    command => "curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    user    => "vagrant",
    require => [Package["curl"], File["/home/vagrant/.vim/autoload"]],
  }

  exec { "install-vundle":
    cwd     => "/home/vagrant/.vim/bundle",
    user    => "vagrant",
    command => "git clone https://github.com/gmarik/Vundle.vim.git",
    require => [Package["git"], File["/home/vagrant/.vim/bundle"]],
  }

  file { "/home/vagrant/.vimrc":
    ensure  => present,
    source  => "/etc/puppet/files/.vimrc",
    require => [Exec["install-vundle"], Exec["install-pathogen"]],
  }
}