#
# = MySQL
#

#
# Package install
#
execute "yum install mysql-client" do
  command "yum install -y http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/MySQL-client-5.6.10-1.el6.x86_64.rpm"
  not_if "rpm -q MySQL-client"
end

 execute "yum install mysql-shared-compat" do
  command "yum install -y http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/MySQL-shared-compat-5.6.10-1.el6.x86_64.rpm"
  not_if "rpm -q MySQL-shared-compat"
 end

execute "yum install mysql-server" do
  command "yum install -y http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/MySQL-server-5.6.10-1.el6.x86_64.rpm"
  not_if "rpm -q MySQL-server"
end

execute "yum install mysql-devel" do
  command "yum install -y http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/MySQL-devel-5.6.10-1.el6.x86_64.rpm"
  not_if "rpm -q MySQL-devel"
end

#
# chkconfig
#
execute "chkconfig mysql on" do
  command "chkconfig mysql on"
end

#
# Configuration files
#
#template "/etc/my.cnf" do
#  source "my.cnf.erb"
#  owner "root"
#  group "root"
#  mode "0644"
#  notifies :restart, "service[mysqld]"
#end

#
# Command
#
service "mysql" do
  stop_command    "/etc/init.d/mysql stop"
  start_command   "/etc/init.d/mysql start"
  restart_command "/etc/init.d/mysql restart"
  action :nothing
end
