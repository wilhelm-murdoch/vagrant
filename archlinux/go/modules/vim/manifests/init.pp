class packages {
  @package { [
    "curl",
    "git",
  ]: }
}

class vim {
  include packages

  realize [
    Package["curl"],
    Package["git"],
  ]

  file { [
      "/home/vagrant/.vim",
      "/home/vagrant/.vim/bundle",
      "/home/vagrant/.vim/colors",
      "/home/vagrant/.vim/autoload",
    ]:
    ensure  => directory,
    group   => "vagrant",
    owner   => "vagrant",
  }

  file { "/home/vagrant/.vim/colors/molokai.vim":
    ensure  => present,
    source  => "/etc/puppet/files/molokai.vim",
    require => File["/home/vagrant/.vim/colors"],
  }

  exec { "install-vim-go":
    cwd     => "/home/vagrant/.vim/bundle",
    user    => "vagrant",
    command => "git clone https://github.com/fatih/vim-go.git",
    require => [
      Package["git"],
      File["/home/vagrant/.vim/bundle"],
    ],
  }

  exec { "install-pathogen":
    command => "curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    user    => "vagrant",
    require => [
      Package["curl"],
      File["/home/vagrant/.vim/autoload"],
    ],
  }

  exec { "install-vundle":
    cwd     => "/home/vagrant/.vim/bundle",
    user    => "vagrant",
    command => "git clone https://github.com/gmarik/Vundle.vim.git",
    require => [
      Package["git"],
      File["/home/vagrant/.vim/bundle"],
    ],
  }

  file { "/home/vagrant/.vimrc":
    ensure  => present,
    source  => "/etc/puppet/files/.vimrc",
    require => [
      Exec["install-vundle"],
      Exec["install-pathogen"]
    ],
  }
}
