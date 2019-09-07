#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

group 'webadmin'

user 'webadmin' do 
  group 'webadmin'
  shell '/bin/bash'
  system true
end

template '/var/www/html/index.html' do # ~FC033
  source 'index.html.erb'
  mode '0644'
  user 'webadmin'
  group 'webadmin'
end
