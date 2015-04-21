require 'spec_helper'

describe 'railspeppers::db' do
  describe service('mysql') do
    it { should be_enabled  }
    it { should be_running  }

    it 'is listening on port 3306' do
      expect(port(3306)).to be_listening
    end

    describe file('/var/run/mysqld/mysqld.sock') do
      it { should be_socket }
    end

    describe 'test database' do
      describe command("echo \'SHOW DATABASES LIKE 'testdb'\' | mysql --user=testuser --password=testpassword") do
        its(:stdout) { should match /testdb/ }
      end
    end
  end
end
