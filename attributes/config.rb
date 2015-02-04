# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Attributes:: config
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

default['beef']['config']['debug'] = false
default['beef']['config']['client_debug'] = false
default['beef']['config']['crypto_default_value_length'] = 80
default['beef']['config']['restrictions']['permitted_hooking_subnet'] =
  '0.0.0.0/0'
default['beef']['config']['restrictions']['permitted_ui_subnet'] = '0.0.0.0/0'
default['beef']['config']['http']['debug'] = false
default['beef']['config']['http']['host'] = '0.0.0.0'
default['beef']['config']['http']['port'] = 3000
default['beef']['config']['http']['xhr_poll_timeout'] = 5000
default['beef']['config']['http']['dns_host'] = 'localhost'
default['beef']['config']['http']['dns_port'] = 53
default['beef']['config']['http']['web_ui_basepath'] = '/ui'
default['beef']['config']['http']['hook_file'] = '/hook.js'
default['beef']['config']['http']['hook_session_name'] = 'BEEFHOOK'
default['beef']['config']['http']['session_cookie_name'] = 'BEEFSESSION'
default['beef']['config']['http']['restful_api']['allow_cors'] = false
default['beef']['config']['http']['restful_api']['cors_allowed_domains'] =
  'http://browserhacker.com'
default['beef']['config']['http']['websocket']['enable'] = false
default['beef']['config']['http']['websocket']['port'] = 61_985
default['beef']['config']['http']['websocket']['secure'] = true
default['beef']['config']['http']['websocket']['secure_port'] = 61_986
default['beef']['config']['http']['websocket']['ws_poll_timeout'] = 1000
default['beef']['config']['http']['web_server_imitation']['enable'] = true
default['beef']['config']['http']['web_server_imitation']['type'] = 'apache'
default['beef']['config']['http']['https']['enable'] = false
default['beef']['config']['http']['https']['key'] = 'beef_key.pem'
default['beef']['config']['http']['https']['cert'] = 'beef_cert.pem'
default['beef']['config']['database']['driver'] = 'sqlite'
default['beef']['config']['database']['db_file'] = 'beef.db'
default['beef']['config']['database']['db_host'] = 'localhost'
default['beef']['config']['database']['db_port'] = 5432
default['beef']['config']['database']['db_name'] = 'beef'
default['beef']['config']['database']['db_user'] = 'beef'
default['beef']['config']['database']['db_passwd'] = 'beef123'
default['beef']['config']['database']['db_encoding'] = 'UTF-8'
default['beef']['config']['credentials']['user'] = 'beef'
default['beef']['config']['credentials']['passwd'] = 'beef'
default['beef']['config']['autorun']['enable'] = true
default['beef']['config']['autorun']['allow_user_notify'] = true
default['beef']['config']['geoip']['enable'] = false
default['beef']['config']['geoip']['database'] = '/opt/GeoIP/GeoLiteCity.dat'
default['beef']['config']['extension']['requester']['enable'] = true
default['beef']['config']['extension']['proxy']['enable'] = true
default['beef']['config']['extension']['metasploit']['enable'] = false
default['beef']['config']['extension']['social_engineering']['enable'] = true
default['beef']['config']['extension']['evasion']['enable'] = false
default['beef']['config']['extension']['console']['shell']['enable'] = false
default['beef']['config']['extension']['ipec']['enable'] = true
default['beef']['config']['extension']['dns']['enable'] = false
