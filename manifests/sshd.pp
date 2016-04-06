# Class: ssh::sshd
#
# Class to manage the main sshd_config file.
#
# All parameters default to undef, meaning that the original
# defaults are used.
#
# Sample Usage :
#     create_resources('::ssh::sshd', $confighash)
#
define ssh::sshd (
  $port                            = undef,
  $permitrootlogin                 = undef,
  $pubkeyauthentication            = undef,
  $passwordauthentication          = 'no',
  $challengeresponseauthentication = undef,
  $usepam                          = undef,
  $x11forwarding                   = undef,
  $clientaliveinterval             = undef,
  $clientalivecountmax             = undef,
  $usedns                          = undef,
  $printmotd                       = undef,
  $bannerpath                      = undef,
  $match                           = undef,
  $authorizedkeyscommand           = undef,
  $authorizedkeyscommanduser       = undef,
  $allowgroups                     = undef,
  $internalsftp                    = false,
  $template_dir                    = 'rhel7',
  $service_name                    = 'sshd',
) {

  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/${template_dir}/sshd_config.erb"),
    notify  => Service[$service_name],
  }

}
