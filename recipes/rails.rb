include_recipe 'apt'

apt_repository 'brightbox-ruby-ng' do
  action       :add
  uri          'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'C3173AA6'
end

%w(ruby1.9.1 ruby1.9.1-dev).each do |package_name|
  apt_package package_name do
    action :remove
  end
end

apt_package 'build-essential'
apt_package "ruby#{node['railspeppers']['ruby_version']}"
apt_package "ruby#{node['railspeppers']['ruby_version']}"
apt_package 'git'
apt_package 'libmysqlclient-dev'
apt_package 'qt5-default'
apt_package 'libqt5webkit5-dev'

execute 'config ruby bin' do
  command "update-alternatives --set ruby /usr/bin/ruby#{node['railspeppers']['ruby_version']} && update-alternatives --set gem /usr/bin/gem#{node['railspeppers']['ruby_version']}"
end

gem_package 'bundler' do
  version node['railspeppers']['bundler_version']
  gem_binary '/usr/bin/gem'
end

include_recipe 'nodejs::nodejs_from_binary'
include_recipe 'nodejs::npm'

nodejs_npm 'bower' do
  version node['railspeppers']['bower_version']
end

nodejs_npm 'phantomjs' do
  version node['railspeppers']['phantomjs_version']
end
