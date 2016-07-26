# Class: ssh::sshd
#
# Class to manage the main sshd_config file.
#
# All parameters default to undef, meaning that the original
# defaults are used.
#
# Sample Usage :
#     include '::ssh::sshd'
#
class ssh (
  $port                            = undef,
  $protocol                        = undef,
  $ciphers                         = undef,
  $macs                            = undef,
  $permitrootlogin                 = undef,
  $pubkeyauthentication            = undef,
  $permitemptypasswords            = undef,
  $passwordauthentication          = undef,
  $challengeresponseauthentication = undef,
  $usepam                          = undef,
  $x11forwarding                   = undef,
  $permituserenvironment           = undef,
  $clientaliveinterval             = undef,
  $clientalivecountmax             = undef,
  $usedns                          = undef,
  $bannerpath                      = undef,
  $match                           = {},
  $authorizedkeyscommand           = undef,
  $authorizedkeyscommanduser       = undef,
  $allowgroups                     = undef,
  $internalsftp                    = false,
  $template_dir                    = 'rhel7',
  $service_name                    = 'sshd',
) {

  include '::ssh::service'

  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/${template_dir}/sshd_config.erb"),
    notify  => Service[$service_name],
  }

}
