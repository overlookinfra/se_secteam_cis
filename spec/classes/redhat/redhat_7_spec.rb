require 'spec_helper'

describe 'secteam_cis::redhat::redhat_7' do
  test_on = {
    :supported_os => [
      {
        'operatingsystem' => 'RedHat',
        'operatingsystemrelease' => '7',
      },
    ],
  }
  on_supported_os(test_on).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      context 'It should provide a safe /tmp directory' do
        it {
          is_expected.to contain_mount('/tmp').with('options' => 'defaults,rw,nosuid,nodev,noexec,relatime')
        }
      end

      context 'It should provide security-related packaging' do
        it {
          is_expected.to contain_package('AIDE')
          is_expected.to contain_package('libselinux')
          is_expected.to contain_package('audit')
          is_expected.to contain_package('audit-libs')
          is_expected.to contain_package('xinetd').with('ensure' => 'absent')
        }
      end

      context 'It should disable insecure services and enable secure services' do
        it {
          is_expected.to contain_service('auditd').with('ensure' => 'running')
          is_expected.to contain_service('nftables').with('ensure' => 'stopped')
          is_expected.to contain_service('rsyncd').with('ensure' => 'stopped')
        }  
      end

      context 'It should bring in supported security classes' do
        it {
          is_expected.to contain_class('selinux')
          is_expected.to contain_class('yum')
        }
      end

      context 'It should manage the sudoers log' do
        it {
          is_expected.to contain_file_line('sudoers_pty').with('line' => '%Defaults use_pty')
          is_expected.to contain_file_line('sudoers_log').with('line' => '%Defaults logfile="/var/log/sudo.log"')
        }
      end
    end
  end
end