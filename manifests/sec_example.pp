# @summary Manage hand selected Windows security controls
#
#
# @example
#   include secteam_cis::sec_example
class secteam_cis::sec_example {

  #noop()

  registry::value { 'Security item #1 - LimitBlankPasswordUse':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'LimitBlankPasswordUse',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #2 - AuditBaseObjects':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'AuditBaseObjects',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #3 - fullprivilegeauditing':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'fullprivilegeauditing',
    data  => '1',
    type  => binary,
  }

  registry_value { 'Security item #4 - scenoapplylegacyauditpolicy':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\scenoapplylegacyauditpolicy',

  }

  registry::value { 'Security item #5 - crashonauditfail':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'crashonauditfail',
    data  => '0',
    type  => dword,
  }

  registry_value { 'Security item #6 - MachineAccessRestriction':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\policies\Microsoft\windows NT\DCOM\MachineAccessRestriction',
  }

  registry::value { 'Security item #7 - MachineLaunchRestriction':
    key   => 'HKLM\SOFTWARE\policies\Microsoft\windows NT\DCOM',
    value => 'MachineLaunchRestriction'
  }

  registry::value { 'Security item #8 - undockwithoutlogon':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'undockwithoutlogon',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #9 - AllocateCDRoms':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'AllocateCDRoms',
    data  => '0',
  }

  registry::value { 'Security item #10 - AllocateFloppies':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'AllocateFloppies',
    data  => '0',
  }

  registry::value { 'Security item #11 - requiresignorseal':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'requiresignorseal',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #12 - requirestrongkey':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'requirestrongkey',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #13 - DontDisplayLockedUserId':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'DontDisplayLockedUserId',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #14 - LegalNoticeText':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LegalNoticeText',
    data  => 'This system is the property of CORP and may only be accessed by authorized users.',
  }

  registry::value { 'Security item #15 - LegalNoticeCaption':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LegalNoticeCaption',
    data  => 'Warning',
  }

  registry::value { 'Security item #16 - scforceoption':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'scforceoption',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #17 - DisableCAD':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'DisableCAD',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #18 - InactivityTimeoutSecs':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'InactivityTimeoutSecs',
    data  => '900',
    type  => dword,
  }

  registry::value { 'Security item #19 - cachedlogonscount':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'cachedlogonscount',
    data  => '10',
  }

  registry::value { 'Security item #20 - ForceUnlockLogon':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'ForceUnlockLogon',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #21 - scremoveoption':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'scremoveoption',
    data  => '0',
  }

  registry_value { 'Security item #22 - MaxDevicePasswordFailedAttempts':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\MaxDevicePasswordFailedAttempts',
  }

  registry::value { 'Security item #23 - RequireSecuritySignature':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'RequireSecuritySignature',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #24 - EnableSecuritySignature':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'EnableSecuritySignature',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #25 - EnablePlainTextPassword':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'EnablePlainTextPassword',
    data  => '0',
    type  => dword,
  }

  registry_value { 'Security item #26 - SMBServerNameHardeningLevel':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMBServerNameHardeningLevel',
  }

  registry::value { 'Security item #27 - autodisconnect':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'autodisconnect',
    data  => '15',
    type  => dword,
  }

  registry::value { 'Security item #28 - requiresecuritysignature':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'requiresecuritysignature',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #29 - enablesecuritysignature':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'enablesecuritysignature',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #30 - enableforcedlogoff':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'enableforcedlogoff',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #31 - AutoReboot':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\CrashControl',
    value => 'AutoReboot',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #32 - AutoShareServer':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'AutoShareServer',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #33 - EnableICMPRedirect':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'EnableICMPRedirect',
    data  => '0',
    type  => dword,
  }

  registry_value { 'Security item #34 - Hidden':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\Hidden',
  }

  registry::value { 'Security item #35 - KeepAliveTime':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'KeepAliveTime',
    data  => '300000',
    type  => dword,
  }

  registry_value { 'Security item #36 - NoDefaultExempt':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\IPSEC\NoDefaultExempt',
  }

  registry::value { 'Security item #37 - NoNameReleaseOnDemand':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netbt\Parameters',
    value => 'NoNameReleaseOnDemand',
    data  => '1',
    type  => dword,
  }

  registry_value { 'Security item #38 - PerformRouterDiscovery':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\PerformRouterDiscovery',
  }

  registry_value { 'Security item #39 - TcpMaxDataRetransmissions':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\TcpMaxDataRetransmissions',
  }

  registry::value { 'Security item #40 - TcpMaxDataRetransmissions':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'TcpMaxDataRetransmissions',
    data  => '3',
    type  => dword,
  }

  registry::value { 'Security item #41 - AutoAdminLogon':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'AutoAdminLogon',
    data  => '0',
    type  => dword,
  }

  registry_value { 'Security item #42 - DisableIPSourceRouting':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisableIPSourceRouting',
  }

  registry::value { 'Security item #43 - DisableIPSourceRouting':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'DisableIPSourceRouting',
    data  => '2',
    type  => dword,
  }

  registry::value { 'Security item #44 - SafeDllSearchMode':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager',
    value => 'SafeDllSearchMode',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #45 - ScreenSaverGracePeriod':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'ScreenSaverGracePeriod',
    data  => '0',
  }

  registry_value { 'Security item #46 - WarningLevel':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\WarningLevel',
  }

  registry::value { 'Security item #47 - DisableDomainCreds':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'DisableDomainCreds',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #48 - NullSessionPipes':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'NullSessionPipes',
    data  => [],
    type  => array,
  }

  registry::value { 'Security item #49 - NullSessionShares':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'NullSessionShares',
    data  => [],
    type  => array,
  }

  registry::value { 'Security item #50 - RestrictAnonymous':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictAnonymous',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #51 - RestrictAnonymousSAM':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictAnonymousSAM',
    data  => '1',
    type  => dword,
  }

  registry::value { 'Security item #52 - EveryoneIncludesAnonymous':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'EveryoneIncludesAnonymous',
    data  => '0',
    type  => dword,
  }

  registry::value { 'Security item #53 - Machine':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths',
    value => 'Machine',
    type  => array,
    data  => [
      'System\CurrentControlSet\Control\Print\Printers',
      'System\CurrentControlSet\Services\Eventlog',
      'Software\Microsoft\OLAP Server',
      'Software\Microsoft\Windows NT\CurrentVersion\Print',
      'Software\Microsoft\Windows NT\CurrentVersion\Windows',
      'System\CurrentControlSet\Control\ContentIndex',
      'System\CurrentControlSet\Control\Terminal Server',
      'System\CurrentControlSet\Control\Terminal Server\UserConfig',
      'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration',
      'Software\Microsoft\Windows NT\CurrentVersion\Perflib',
      'System\CurrentControlSet\Services\SysmonLog',
    ],
  }

  registry::value { 'Security item #54 - Machine':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths',
    value => 'Machine',
    type  => array,
    data  => [
      'System\CurrentControlSet\Control\ProductOptions',
      'System\CurrentControlSet\Control\Server Applications',
      'Software\Microsoft\Windows NT\CurrentVersion',
      ]
  }

  registry::value { 'Security item #55 - restrictnullsessaccess':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    value => 'restrictnullsessaccess',
    data  => '1',
  }

  registry::value { 'Security item #56 - ForceGuest':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'ForceGuest',
    data  => '0',
  }

  registry_value { 'Security item #57 - AllowOnlineID':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID',
  }

  registry_value { 'Security item #58 - SupportedEncryptionTypes':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\SupportedEncryptionTypes',
  }

  registry_value { 'Security item #59 - ClientAllowedNTLMServers':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\ClientAllowedNTLMServers',
  }

  registry_value { 'Security item #60 - DCAllowedNTLMServers':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\DCAllowedNTLMServers',
  }

  registry_value { 'Security item #61 - AuditReceivingNTLMTraffic':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\AuditReceivingNTLMTraffic',
  }

  registry_value { 'Security item #62 - AuditNTLMInDomain':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\AuditNTLMInDomain',
  }

  registry_value { 'Security item #63 - RestrictReceivingNTLMTraffic':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\RestrictReceivingNTLMTraffic',
  }

  registry_value { 'Security item #64 - RestrictNTLMInDomain':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\RestrictNTLMInDomain',
  }

  registry_value { 'Security item #65 - RestrictSendingNTLMTraffic':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\RestrictSendingNTLMTraffic',
  }

  registry::value { 'Security item #66 - UseMachineId':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'UseMachineId',
    data  => '1',
  }

  registry::value { 'Security item #67 - allownullsessionfallback':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'allownullsessionfallback',
    data  => '1',
  }

  registry::value { 'Security item #68 - NoLMHash':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'NoLMHash',
    data  => '1',
  }

  registry::value { 'Security item #69 - LDAPClientIntegrity':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Services\LDAP',
    value => 'LDAPClientIntegrity',
    data  => '1',
  }

  registry::value { 'Security item #70 - NTLMMinClientSec':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'NTLMMinClientSec',
    data  => '537395248',
  }

  registry::value { 'Security item #71 - NTLMMinServerSec':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'NTLMMinServerSec',
    data  => '537395248',
  }

  registry::value { 'Security item #72 - securitylevel':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole',
    value => 'securitylevel',
    data  => '0',
  }

  registry::value { 'Security item #73 - setcommand':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole',
    value => 'setcommand',
    data  => '0',
  }

  registry::value { 'Security item #74 - ShutdownWithoutLogon':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ShutdownWithoutLogon',
    data  => '0',
  }

  registry::value { 'Security item #75 - ClearPageFileAtShutdown':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management',
    value => 'ClearPageFileAtShutdown',
    data  => '0',
  }

  registry::value { 'Security item #76 - ForceKeyProtection':
    key   => 'HKLM\SOFTWARE\Policies\Microsoft\Cryptography',
    value => 'ForceKeyProtection',
    data  => '2',
  }

  registry::value { 'Security item #77 - Enabled':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy',
    value => 'Enabled',
    data  => '0',
  }

  registry::value { 'Security item #78 - ObCaseInsensitive':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel',
    value => 'ObCaseInsensitive',
    data  => '1',
  }

  registry::value { 'Security item #79 - ProtectionMode':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager',
    value => 'ProtectionMode',
    data  => '1',
  }

  registry_value { 'Security item #80 - Optional':
    ensure => absent,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems\Optional',
  }

  registry::value { 'Security item #81 - AuthenticodeEnabled':
    key   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers',
    value => 'AuthenticodeEnabled',
    data  => '0',
  }

  registry::value { 'Security item #82 - FilterAdministratorToken':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'FilterAdministratorToken',
    data  => '1',
  }

  registry::value { 'Security item #83 - EnableUIADesktopToggle':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableUIADesktopToggle',
    data  => '0',
  }

  registry::value { 'Security item #84 - ConsentPromptBehaviorAdmin':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ConsentPromptBehaviorAdmin',
    data  => '5',
  }

  registry::value { 'Security item #85 - ConsentPromptBehaviorUser':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ConsentPromptBehaviorUser',
    data  => '3',
  }

  registry::value { 'Security item #86 - EnableInstallerDetection':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableInstallerDetection',
    data  => '1',
  }

  registry::value { 'Security item #87 - ValidateAdminCodeSignatures':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ValidateAdminCodeSignatures',
    data  => '0',
  }

  registry::value { 'Security item #88 - EnableSecureUIAPaths':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableSecureUIAPaths',
    data  => '1',
  }

  registry::value { 'Security item #89 - EnableLUA':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableLUA',
    data  => '1',
  }

  registry::value { 'Security item #90 - PromptOnSecureDesktop':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'PromptOnSecureDesktop',
    data  => '1',
  }

  registry::value { 'Security item #91 - EnableVirtualization':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableVirtualization',
    data  => '1',
  }

  registry::value { 'Security item #92 - NoDriveTypeAutoRun':
    key   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
    value => 'NoDriveTypeAutoRun',
    data  => '255',
  }

  registry_value { 'Security item #93 - Retention':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security\Retention',
  }

  registry_value { 'Security item #94 - Retention':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\System\Retention',
  }

  registry_value { 'Security item #95 - Retention':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application\Retention',
  }

  registry::value { 'Security item #96 - MinEncryptionLevel':
    key   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'MinEncryptionLevel',
    data  => '3',
  }

  registry_value { 'Security item #97 - AlwaysInstallElevated':
    ensure => absent,
    path   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated',
  }

}

