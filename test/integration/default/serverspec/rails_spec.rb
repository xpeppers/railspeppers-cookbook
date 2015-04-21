require 'spec_helper'

describe 'railspeppers::rails' do
  describe package('ruby2.2') do
    it { should be_installed }
  end

  describe 'bundler is installed' do
    describe command('gem list bundler -i') do
      its(:stdout) { should match /true/ }
    end
  end

  describe service('nginx') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(80) do
      it { should be_listening }
    end
  end
end
