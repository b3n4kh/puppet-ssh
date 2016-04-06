# Class: ssh
#
# Class to manage the main sshd_config file.
#
# All parameters default to undef, meaning that the original
# defaults are used.
#
# Sample Usage :
#     include '::ssh'
#
class ssh (
  $config_hash      = {},
  $template_dir     = $::ssh::params::template_dir,
  $service_name     = $::ssh::params::service_name,
) inherits ::ssh::params {

  include '::ssh::service'

  create_resources('::ssh::sshd', $config_hash)

}
