package "mysql-server-#{node['railspeppers']['db']['version']}"

mysql2_chef_gem 'default' do
  client_version node['railspeppers']['db']['version']
  action :install
end

service 'mysql' do
  action [:enable, :start]
end

connection_info = {
  host: 'localhost',
  username: 'root',
  password: node['railspeppers']['db']['root_password']
}

mysql_database node['railspeppers']['db']['name'] do
  connection connection_info
  action :create
end

mysql_database_user node['railspeppers']['db']['user'] do
  connection connection_info
  database_name node['railspeppers']['db']['name']
  password node['railspeppers']['db']['password']
  privileges [:all]
  action [:create, :grant]
end
