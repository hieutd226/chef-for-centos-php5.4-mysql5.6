#
# = httpd
#

#
# Package install
#
execute "yum install memcached" do
  command "yum install -y --enablerepo=remi memcached"
  not_if "rpm -q memcached"
end

execute "yum install php-pecl-memcached" do
  command "yum install -y --enablerepo=remi php-pecl-memcached"
  not_if "rpm -q php-pecl-memcached"
end

#
# chkconfig
#
execute "chkconfig memcached on" do
  command "chkconfig memcached on"
end

#
# command
#
service "memcached" do
  stop_command    "/etc/init.d/memcached stop"
  start_command   "/etc/init.d/memcached start"
  restart_command "/etc/init.d/memcached condrestart"
  action :nothing
end

