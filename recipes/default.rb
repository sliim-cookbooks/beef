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
  package pkg do
    action :install
  end
end

user node['beef']['user'] do
  action :create
  system false
  home node['beef']['user_home']
end

node.default['rbenv']['user'] = node['beef']['user']
node.default['rbenv']['group'] = node['beef']['user']
node.default['rbenv']['user_home'] = node['beef']['user_home']
node.default['rbenv']['root_path'] = "#{node['beef']['user_home']}/.rbenv"

include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node['beef']['ruby_version'] do
  global true
end

rbenv_gem 'install-bundler-ruby' do
  package_name 'bundler'
  ruby_version node['beef']['ruby_version']
end

# FIXME: Bad owner..
fix_owner_cmd = 'chown -R '
fix_owner_cmd << node['beef']['user'] << ':'
fix_owner_cmd << node['beef']['user'] << ' '
fix_owner_cmd << node['beef']['user_home']
execute 'fix-home-owner' do
  command fix_owner_cmd
end

git node['beef']['path'] do
  repository 'https://github.com/beefproject/beef.git'
  reference node['beef']['version']
  action :sync
  user node['beef']['user']
  group node['beef']['user']
end

template node['beef']['path'] + '/config.yaml' do
  source 'config.yaml.erb'
  mode 0644
  variables 'config' => node['beef']['config']
end

rbenv_execute 'bundle install' do
  cwd node['beef']['path']
  user node['beef']['user']
  group node['beef']['user']
end

rbenv_execute 'nohup ruby beef >> beef.log 2>> beef.err &' do
  cwd node['beef']['path']
  user node['beef']['user']
  group node['beef']['user']
end
