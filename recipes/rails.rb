include_recipe 'apt'

apt_package 'build-essential'
apt_package 'git'
apt_package 'libmysqlclient-dev'
apt_package 'qt5-default'
apt_package 'libqt5webkit5-dev'

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
