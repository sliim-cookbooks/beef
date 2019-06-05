# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Recipe:: install_src
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

node['beef']['gem_packages'].each do |gem|
  gem_package gem do
    gem_binary "#{node['beef']['ruby_bin_dir']}/gem"
  end
end

user node['beef']['user'] do
  system true
  manage_home false
  home node['beef']['path']
  not_if { node['beef']['user'] == 'root' }
end

group node['beef']['group'] do
  members [node['beef']['user']]
  not_if { node['beef']['group'] == 'root' }
end

directory node['beef']['path'] do
  owner node['beef']['user']
  group node['beef']['group']
end

execute 'beef-bundle-install' do
  action :nothing
  cwd node['beef']['path']
  command 'bundle install --path=vendor --without test development'
  user node['beef']['user']
  group node['beef']['group']
  environment 'PATH' => "#{node['beef']['ruby_bin_dir']}:#{ENV['PATH']}"
end

file "#{node['beef']['path']}/Gemfile.lock" do
  action :nothing
end

git node['beef']['path'] do
  repository node['beef']['git_repository']
  reference node['beef']['git_reference']
  user node['beef']['user']
  group node['beef']['group']
  notifies :delete, "file[#{node['beef']['path']}/Gemfile.lock]", :immediately
  notifies :run, 'execute[beef-bundle-install]', :immediately
end
