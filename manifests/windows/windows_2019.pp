# @summary Manage hand selected CIS controls for Windows 2019
#
# This class manages specific controls from the CIS benchmark for Windows. 
# The source used is "CIS Microsoft Windows Server 2019 RTM (Release 1809) Benchmark
# v1.0.1 - 11-22-2019"
#
# @example
#   include secteam::os::windows_2019
class secteam_cis::windows::windows_2019 (
  Boolean $firewall_enabled = true,
  String  $password_history = '40',
) {

  # pick 10 controls. ~5 params to override values. 

  # 1.1.1 (L1) Ensure 'Enforce password history' is set to '24 or more password(s)' (Scored)
  local_security_policy { 'Enforce password history':
    ensure       => present,
    policy_value => $password_history,
  }

  # 1.1.4 (L1) Ensure 'Minimum password length' is set to '14 or more character(s)' (Scored)
  #local_security_policy { 'Minimum password length':
  #  ensure         => 'present',
  #  policy_setting => 'MinimumPasswordLength',
  #  policy_type    => 'System Access',
  #  policy_value   => '16',
  #  provider       => 'policy',
  #}

  # 1.1.5 (L1) Ensure 'Password must meet complexity requirements' is set to 'Enabled' (Scored)
  local_security_policy { 'Password must meet complexity requirements':
    ensure       => present,
    policy_value => '1',
  }

  # 2.2.7 (L1) Ensure 'Allow log on locally' is set to 'Administrators' (Scored)
  local_security_policy { 'Allow log on locally':
    ensure       => 'present',
    policy_value => '*S-1-5-32-544,*S-1-5-32-545,*S-1-5-32-551',
  }

  # 9.1.1 (L1) Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)' (Scored)
  # 9.2.1 (L1) Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)' (Scored)
  # 9.3.1 (L1) Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)' (Scored)
  service {'MpsSvc':
    ensure => 'running',
    enable => $firewall_enabled,
  }

  $reg_prefix = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess"

  registry_value { "${reg_prefix}\\Parameters\\FirewallPolicy\\StandardProfile\\EnableFirewall":
    type   => dword,
    data   => '1',
    notify => Service['MpsSvc'],
  }

  registry_value { "${reg_prefix}\\Parameters\\FirewallPolicy\\DomainProfile\\EnableFirewall":
    type   => dword,
    data   => '1',
    notify => Service['MpsSvc'],
  }

  registry_value { "${reg_prefix}\\Parameters\\FirewallPolicy\\PublicProfile\\EnableFirewall":
    type   => dword,
    data   => '1',
    notify => Service['MpsSvc'],
  }

  # 18.9.48.3.3.1 (L2) Ensure 'Do not allow COM port redirection' is set to 'Enabled' (Scored)
  registry_value { 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services\\fDisableCcm':
    type => dword,
    data => '0',
  }

  # 18.9.48.3.3.2 (L1) Ensure 'Do not allow drive redirection' is set to 'Enabled' (Scored)
  registry_value { 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services\\fDisableCdm':
    type => dword,
    data => '1',
  }

  # 19.6.5.1.1 (L2) Ensure 'Turn off Help Experience Improvement Program' is set to 'Enabled' (Scored)
  registry_value { 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\SQMClient\\Windows\\CEIPEnable':
    type => dword,
    data => '1',
  }
}
