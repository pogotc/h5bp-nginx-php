#
# Cookbook Name:: made-nginx
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe "nginx"
include_recipe "php::fpm"

template node['nginx']['dir'] + "/nginx.conf" do
	source "nginx.conf.erb"
end

template node['nginx']['dir'] + "/mime.types" do
	source "mime.types.erb"
end

directory node['nginx']['dir'] + "/h5bp/" do
  action :create
end

directory node['nginx']['dir'] + "/h5bp/location/" do
  action :create
end

directory node['nginx']['dir'] + "/h5bp/directive-only/" do
  action :create
end

template node['nginx']['dir'] + "/h5bp/location/cross-domain-fonts.conf" do
	source "cross-domain-fonts.conf.erb"
end

template node['nginx']['dir'] + "/h5bp/location/expires.conf" do
	source "expires.conf.erb"
end

template node['nginx']['dir'] + "/h5bp/location/protect-system-files.conf" do
	source "protect-system-files.conf.erb"
end

template node['nginx']['dir'] + "/h5bp/directive-only/x-ua-compatible.conf" do
	source "x-ua-compatible.conf.erb"
end

template node['nginx']['dir'] + "/h5bp/basic.conf" do
	source "basic.conf.erb"
end



php_fpm "default" do
	action :add
	socket true
	user "vagrant"
	group "vagrant"
  	socket_path '/var/run/php5-fpm.sock'
  	start_servers 2
	min_spare_servers 2
	max_spare_servers 8
	max_children 8
end