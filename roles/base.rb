name "base"
description ""
run_list(
  "recipe[common]",
  "recipe[selinux]",
  "recipe[yum]",
  "recipe[iptables]",
  "recipe[httpd]",
  "recipe[mysql]",
  "recipe[php]",
  "recipe[memcached]",
  "recipe[redis]",
  "recipe[vsftpd]"
)

default_attributes({
  :role                => "base",
})
