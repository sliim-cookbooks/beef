# -*- coding: utf-8 -*-
#
# Cookbook Name:: beef
# Attributes:: default
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

# Install from package
default['beef']['install_package'] = 'beef-xss'

# Install from sources
default['beef']['packages'] = %w(git libsqlite3-dev build-essential)
default['beef']['gem_packages'] = %w(bundler)
default['beef']['user'] = 'root'
default['beef']['group'] = node['beef']['user']
default['beef']['path'] = '/opt/beef'
default['beef']['git_repository'] = 'https://github.com/beefproject/beef.git'
default['beef']['git_reference'] = 'beef-0.4.7.3'
default['beef']['ruby_bin_dir'] = '/opt/chef/embedded/bin'

# GeoIP
default['beef']['geoip_url'] = 'https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'

# Service
default['beef']['service']['NAME'] = 'beef-xss'
default['beef']['service']['USER'] = node['beef']['user']
default['beef']['service']['HOME'] = node['beef']['path']

# config
default['beef']['config_file'] = nil
default['beef']['extensions_path'] = nil
default['beef']['config']['extensions'] = {}
default['beef']['config']['beef'] = {
  version: '0.4.7.3-alpha',
  debug: false,
  client_debug: false,
  crypto_default_value_length: 80,
  credentials: {
    user: 'beef',
    passwd: 'beef',
  },
  restrictions: {
    permitted_hooking_subnet: ['0.0.0.0/0', '::/0'],
    permitted_ui_subnet: ['0.0.0.0/0', '::/0'],
    api_attempt_delay: '0.05',
  },
  http: {
    debug: false,
    host: '0.0.0.0',
    port: 3000,
    xhr_poll_timeout: 1000,
    hook_file: '/hook.js',
    hook_session_name: 'BEEFHOOK',
    restful_api: {
      allow_cors: false,
      cors_allowed_domains: 'http://browserhacker.com',
    },
    websocket: {
      enable: false,
      port: 61_985,
      secure: true,
      secure_port: 61_986,
      ws_poll_timeout: 1000,
      ws_connect_timeout: 500,
    },
    web_server_imitation: {
      enable: true,
      type: 'apache',
      hook_404: false,
      hook_root: false,
    },
    https: {
      enable: false,
      key: 'beef_key.pem',
      cert: 'beef_cert.pem',
    },
  },
  database: {
    driver: 'sqlite',
    db_file: 'beef.db',
    db_host: 'localhost',
    db_port: 5432,
    db_name: 'beef',
    db_user: 'beef',
    db_passwd: 'beef123',
    db_encoding: 'UTF-8',
  },
  autorun: {
    result_poll_interval: 300,
    result_poll_timeout: 5000,
    continue_after_timeout: true,
  },
  dns_hostname_lookup: false,
  geoip: {
    enable: true,
    database: '/opt/GeoIP/GeoLite2-City.mmdb',
  },
  integration: {
    phishing_frenzy: {
      enable: false,
    },
  },
  extension: {
    admin_ui: { enable: true, base_path: '/ui' },
    demos: { enable: true },
    events: { enable: true },
    evasion: { enable: false },
    requester: { enable: true },
    proxy: { enable: true },
    network: { enable: true },
    metasploit: { enable: false },
    social_engineering: { enable: true },
    xssrays: { enable: true },
  },
}
