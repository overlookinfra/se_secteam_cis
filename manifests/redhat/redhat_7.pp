# @summary Manage hand selected CIS controls for Rhel 7
#
# Manages CIS controls
#
# @example
#   secteam_cis::redhat::redhat_7
class secteam_cis::redhat::redhat_7 (

  String $selinux_status = 'enforcing',
  Array $audit_pkgs = [ 'audit', 'audit-libs']

) {

  # 1.1.2 Ensure /tmp is configured (Scored)
  # 1.1.3 Ensure nodev option set on /tmp partition (Scored)
  # 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
  # 1.1.5 Ensure noexec option set on /tmp partition (Scored)
  mount { '/tmp':
    ensure  => 'mounted',
    device  => 'tmpfs',
    dump    => '0',
    fstype  => 'tmpfs',
    options => 'defaults,rw,nosuid,nodev,noexec,relatime',
    pass    => '0',
    target  => '/etc/fstab',
    tag     => ['CIS_RHEL_1'],
  }

  # 1.2.2 Ensure gpgcheck is globally activated (Scored)
  class { 'yum':
    config_options => {
      gpgcheck    => true,
      },
    tag            => ['CIS_RHEL_1'],
  }

  # 1.3.2 Ensure sudo commands use pty (Scored)
  file_line { 'sudoers_pty':
    path => '/etc/sudoers',
    line => '%Defaults use_pty',
    tag  => ['CIS_RHEL_1'],
  }

  # 1.3.3 Ensure sudo log file exists (Scored)
  file_line { 'sudoers_log':
    path => '/etc/sudoers',
    line => '%Defaults logfile="/var/log/sudo.log"',
    tag  => ['CIS_RHEL_1'],
  }

  # 1.4.1 Ensure AIDE is installed (Scored)
  package { 'aide':
    ensure   => 'present',
    provider => 'yum',
    tag      => ['CIS_RHEL_1'],
  }

  # 1.7.1.1 Ensure SELinux is installed (Scored)
  package { 'libselinux':
    ensure   => 'present',
    provider => 'yum',
    tag      => ['CIS_RHEL_1'],
  }

  # 1.7.1.3 Ensure SELinux policy is configured (Scored)
  class { 'selinux':
    mode => $selinux_status,
    type => 'targeted',
    tag  => ['CIS_RHEL_1'],
  }

  # 2.1.1 Ensure xinetd is not installed (Scored)
  package { 'xinetd':
    ensure   => 'absent',
    provider => 'yum',
    tag      => ['CIS_RHEL_2'],
  }

  # 2.2.3 Ensure rsync service is not enabled (Scored)
  service { 'rsyncd':
    ensure => 'stopped',
    enable => 'false',
    tag    => ['CIS_RHEL_2'],
  }

  # 3.4.2.2 Ensure nftables is not enabled (Scored)
  service { 'nftables':
    ensure => 'stopped',
    enable => 'false',
    tag    => ['CIS_RHEL_3'],
  }

  # 4.1.1.1 Ensure auditd is installed (Scored)
  package { $audit_pkgs:
    ensure   => 'present',
    provider => 'yum',
    tag      => ['CIS_RHEL_4'],
  }

  # 4.1.1.2 Ensure auditd service is enabled (Scored)
  service { 'auditd':
    ensure => 'running',
    enable => 'true',
    tag    => ['CIS_RHEL_4'],
  }

}
