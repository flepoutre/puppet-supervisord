# Define: supervisord::ctlplugin
#
# This define creates a ctlplugin section in supervisord.conf
#
# Sadly, I have been unable to find any documentation or mention of this stanza type
# in any of supervisord docs or code, but I am using it in production and it works.
#
#
# Documentation on parameters available at:
# http://supervisord.org/configuration.html#program-x-section-settings
#
# @param ctl_factory
# @param ensure
#
define supervisord::ctlplugin (
  Optional[String] $ctl_factory = undef,
  String $ensure                = present,
) {
  include supervisord

  concat::fragment { "ctlplugin:${name}":
    target  => $supervisord::config_file,
    content => template('supervisord/conf/ctlplugin.erb'),
    order   => 70,
  }
}
