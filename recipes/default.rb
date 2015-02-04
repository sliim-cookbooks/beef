# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Recipe:: default
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

node['beef']['packages'].each do |pkg|
  package pkg
end

gem_package 'bundler'

user node['beef']['user'] do
  system true
  supports manage_home: false
  home node['beef']['path']
  not_if { node['beef']['user'] == 'root' }
end

execute 'chown-beef-dir' do
  action :nothing
  command 'chown -R '\
          "#{node['beef']['user']}:#{node['beef']['user']}"\
          " #{node['beef']['path']}"
end

git node['beef']['path'] do
  repository node['beef']['git_repository']
  reference node['beef']['git_reference']
  notifies :run, 'execute[chown-beef-dir]', :immediately
end

template node['beef']['path'] + '/config.yaml' do
  owner node['beef']['user']
  group node['beef']['user']
  source 'config.yaml.erb'
  variables config: node['beef']['config']
end

execute 'bundle install' do
  cwd node['beef']['path']
  user 'root'
end

execute 'nohup ruby beef >> beef.log 2>> beef.err &' do
  cwd node['beef']['path']
  user node['beef']['user']
  group node['beef']['user']
end
