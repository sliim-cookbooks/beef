# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Recipe:: geoip_database
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

geoip_db = node['beef']['config']['beef']['geoip']['database']
geoip_dir = File.dirname(geoip_db)

directory geoip_dir

execute 'beef-untar-geoip-database' do
  action :nothing
  command "tar xzf #{Chef::Config[:file_cache_path]}/geoip.tar.gz -C #{geoip_dir} --strip-components=1"
end

remote_file "#{Chef::Config[:file_cache_path]}/geoip.tar.gz" do
  source node['beef']['geoip_url']
  notifies :run, 'execute[beef-untar-geoip-database]'
end
