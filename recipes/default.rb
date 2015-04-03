mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password 'change me'
  socket '/var/lib/mysql/mysql.sock'
  action [:create, :start]
end

mysql_config 'default' do
  source 'mysite.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end
