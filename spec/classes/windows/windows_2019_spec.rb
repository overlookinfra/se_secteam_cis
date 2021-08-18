require 'spec_helper'

describe 'secteam_cis::windows::windows_2019' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'Windows',
        'operatingsystemrelease' => '2019',
      },
    ],
  }

  on_supported_os(test_on).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      context 'It should provide local security policies' do
        it {
          is_expected.to contain_local_security_policy('Enforce password history')
          # is_expected.to contain_local_security_policy('Minimum password length')
          is_expected.to contain_local_security_policy('Password must meet complexity requirements')
          is_expected.to contain_local_security_policy('Allow log on locally')
        }
      end

      context 'The firewall should be running' do
        it {
          is_expected.to contain_service('MpsSvc').with('ensure' => 'running')
        }
      end

      context 'It should manage security-related registry values' do
        it {
          is_expected.to contain_registry_value('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile\\EnableFirewall')
          is_expected.to contain_registry_value('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\Services\\SharedAccess\\Parameters\\FirewallPolicy\\DomainProfile\\EnableFirewall')
          is_expected.to contain_registry_value('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\PublicProfile\\EnableFirewall')
          is_expected.to contain_registry_value('HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services\\fDisableCcm')
          is_expected.to contain_registry_value('HKEY_LOCAL_MACHINE\\Software\\Microsoft\\SQMClient\\Windows\\CEIPEnable')
        }
      end
    end
  end
end
