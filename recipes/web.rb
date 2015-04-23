include_recipe 'apt'
include_recipe 'nginx'

template '/etc/nginx/sites-available/localhost.com' do
  source 'localhost.com.erb'
  mode '00644'
  variables({
    https: node['railspeppers']['https_enabled']
  })
end

link '/etc/nginx/sites-enabled/localhost.com' do
  to '/etc/nginx/sites-available/localhost.com'
end

cookbook_file '/etc/sysctl.conf' do
  source 'sysctl.conf'
  mode 00644
end

execute 'reload sysctl,conf' do
  command 'sysctl -p /etc/sysctl.conf'
end
