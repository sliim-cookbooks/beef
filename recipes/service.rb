# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Recipe:: service
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'beef'

template "/etc/init.d/#{node['beef']['service']['NAME']}" do
  owner 'root'
  group 'root'
  mode '0755'
  source 'service/init.erb'
end

template "/etc/default/#{node['beef']['service']['NAME']}" do
  owner 'root'
  group 'root'
  mode '0644'
  source 'service/default.erb'
end

service node['beef']['service']['NAME'] do
  action [:enable, :start]
  supports status: true, start: true, stop: true, restart: true
  subscribes :restart,
             "template[/etc/init.d/#{node['beef']['service']['NAME']}]",
             :delayed
  subscribes :restart,
             "template[/etc/default/#{node['beef']['service']['NAME']}]",
             :delayed
end

execute 'systemctl-daemon-reload' do
  action :nothing
  command 'systemctl daemon-reload'
  only_if { node['init_package'] == 'systemd' }
  subscribes :run,
             "template[/etc/init.d/#{node['beef']['service']['NAME']}]",
             :immediately
end
