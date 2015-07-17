require 'spec_helper'

describe 'logforward' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "logforward class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('logforward::params') }
          it { is_expected.to contain_class('logforward::install').that_comes_before('logforward::config') }
          it { is_expected.to contain_class('logforward::config') }
          it { is_expected.to contain_class('logforward::service').that_subscribes_to('logforward::config') }

          it { is_expected.to contain_service('logforward') }
          it { is_expected.to contain_package('logforward').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'logforward class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('logforward') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
