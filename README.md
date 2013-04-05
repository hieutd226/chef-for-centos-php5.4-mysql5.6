# Chef for CentOS with PHP 5.4 and MySQL 5.6

This is a sample chef repository and installation steps document for CentOS6 forked from kohkimakimoto/chef-for-centos.

It will Install PHP 5.4, MySQL 5.6, redis, memcached, and httpd.

At this repository you don't use chef-server.
You only use chef-solo and git command in the custom bash script `chef-host`.

# Usage

Following will build your CentOS sever environment in a few steps.

1. Modify your host name.

        # vi /etc/sysconfig/network

    You need to edit like following.

        NETWORKING=yes
        HOSTNAME=web

1. Reboot system to use modified hostname.

        # reboot

1. Install chef using Omnibus. You only run below command.

        # curl -L https://www.opscode.com/chef/install.sh | bash

    note) Omunibus is a installer of chef packaging. If you want to get more infomations, see `http://www.opscode.com/blog/2012/06/29/omnibus-chef-packaging/`.

1. Install git

        # yum install -y git

1. Clone this git repository

        # git clone https://github.com/shufo/chef-for-centos-php5.4-mysql5.6.git /var/chef

1. Run chef-solo using following command

        # sh /var/chef/bin/chef-host

    You will get environments of Apache(httpd), MySQL, PHP and 3rd party yum repositories(remi and epel).

# See also

The following page is original blog post about it written in Japanese.

http://kohkimakimoto.hatenablog.com/entry/2013/02/15/121741



