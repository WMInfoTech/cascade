require 'spec_helper'

describe 'cascade' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "cascade class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('cascade::params') }
        it { should contain_class('cascade::install').that_comes_before('cascade::config') }
        it { should contain_class('cascade::config') }
        it { should contain_class('cascade::service').that_subscribes_to('cascade::config') }

        it { should contain_service('cascade') }
        it { should contain_package('cascade').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'cascade class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('cascade') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
