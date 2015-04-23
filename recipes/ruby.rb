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

apt_package "ruby#{node['railspeppers']['ruby_version']}"
apt_package "ruby#{node['railspeppers']['ruby_version']}"

execute 'config ruby bin' do
  command "update-alternatives --set ruby /usr/bin/ruby#{node['railspeppers']['ruby_version']} && update-alternatives --set gem /usr/bin/gem#{node['railspeppers']['ruby_version']}"
end
