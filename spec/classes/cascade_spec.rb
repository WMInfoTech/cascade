require 'spec_helper'

describe 'cascade', :type => 'class' do

  context "On a Debian/Ubuntu system" do

    let :facts do {
      :osfamily => 'Debian',
    } end

    it { expect contain_class('cascade') }
    it { expect contain_class('cascade::config') }
    it { expect contain_class('cascade::params') }

    describe 'config cascade' do
      it { expect contain_file('/etc/tomcat7/server.xml') }
      it { expect contain_file('/etc/tomcat7/catalina.policy') }
      it { expect contain_file('/etc/tomcat7/catalina.properties') }
      it { expect contain_file('/etc/tomcat7/ehcache.properties') }
      it { expect contain_file('/etc/tomcat7/ehcache.xml') }
      it { expect contain_file('/etc/tomcat7/logging.properties') }
    end

  end
end
