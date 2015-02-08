beef Cookbook
=============
Install and configures beefproject - http://beefproject.com.
[![Cookbook Version](https://img.shields.io/cookbook/v/beef.svg)](https://community.opscode.com/cookbooks/beef) [![Build Status](https://secure.travis-ci.org/sliim-cookbooks/beef.png)](http://travis-ci.org/sliim-cookbooks/beef)

Requirements
------------
#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian wheezy

Attributes
----------
#### beef::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['beef']['packages']</tt></td>
    <td>Array</td>
    <td>List of packages to install</td>
    <td><tt>Depends of the platform</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['user']</tt></td>
    <td>String</td>
    <td>User to use for beefproject</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['path']</tt></td>
    <td>String</td>
    <td>Path where will be checkout beef repository.</td>
    <td><tt>/opt/beef</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['git_repository']</tt></td>
    <td>String</td>
    <td>Git repository for beefproject</td>
    <td><tt>https://github.com/beefproject/beef.git</tt></td>
  </tr>  
  <tr>
    <td><tt>['beef']['git_reference']</tt></td>
    <td>String</td>
    <td>Git branch or tag</td>
    <td><tt>master</tt></td>
  </tr>
</table>

#### beef::config
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['beef']['config']['debug']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['client_debug']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['crypto_default_value_length']</tt></td>
    <td>Integer</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['restrictions']['permitted_hooking_subnet']</tt></td>
    <td>String</td>
    <td><tt>0.0.0.0/0</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['restrictions']['permitted_ui_subnet']</tt></td>
    <td>String</td>
    <td><tt>0.0.0.0/0</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['debug']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['host']</tt></td>
    <td>String</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['port']</tt></td>
    <td>Integer</td>
    <td><tt>3000</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['xhr_poll_timeout']</tt></td>
    <td>Integer</td>
    <td><tt>5000</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['dns_host']</tt></td>
    <td>String</td>
    <td><tt>localhost</tt></td>
  </tr>
    <tr>
    <td><tt>['beef']['config']['http']['dns_port']</tt></td>
    <td>Integer</td>
    <td><tt>53</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['web_ui_pasepath']</tt></td>
    <td>String</td>
    <td><tt>/ui</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['hook_file']</tt></td>
    <td>String</td>
    <td><tt>/hook/js</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['hook_session_name']</tt></td>
    <td>String</td>
    <td><tt>BEEFHOOK</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['session_cookie_name']</tt></td>
    <td>String</td>
    <td><tt>BEEFSESSION</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['restful_api']['allow_cors']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['restful_api']['cors_allowed_domains']</tt></td>
    <td>String</td>
    <td><tt>http://browserhacker.com</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['websocket']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['websocket']['port']</tt></td>
    <td>Integer</td>
    <td><tt>61985</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['websocket']['secure']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
    <tr>
    <td><tt>['beef']['config']['http']['websocket']['secure_port']</tt></td>
    <td>Integer</td>
    <td><tt>61986</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['websocket']['ws_poll_timeout']</tt></td>
    <td>Integer</td>
    <td><tt>1000</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['web_server_imitation']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['web_server_imitation']['type']</tt></td>
    <td>String</td>
    <td><tt>apache</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['https']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['https']['key']</tt></td>
    <td>String</td>
    <td><tt>beef_key.pem</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['http']['https']['cert']</tt></td>
    <td>String</td>
    <td><tt>beef_cert.pem</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['driver']</tt></td>
    <td>String</td>
    <td><tt>sqlite</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_file']</tt></td>
    <td>String</td>
    <td><tt>beef.db</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_host']</tt></td>
    <td>String</td>
    <td><tt>localhost</tt></td>
  </tr>
    <tr>
    <td><tt>['beef']['config']['database']['db_port']</tt></td>
    <td>Integer</td>
    <td><tt>5432</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_name']</tt></td>
    <td>String</td>
    <td><tt>beef</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_user']</tt></td>
    <td>String</td>
    <td><tt>beef</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_passwd']</tt></td>
    <td>String</td>
    <td><tt>beef123</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['database']['db_encoding']</tt></td>
    <td>String</td>
    <td><tt>UTF-8</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['credentials']['user']</tt></td>
    <td>String</td>
    <td><tt>beef</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['credentials']['passwd']</tt></td>
    <td>String</td>
    <td><tt>beef</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['autorun']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['autorun']['allow_user_notify']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['geoip']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['geoip']['database']</tt></td>
    <td>String</td>
    <td><tt>/opt/GeoIP/GeoLiteCity.dat</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['requester']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['proxy']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['metasploit']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['social_engineering']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['evasion']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['console']['shell']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['ipec']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['beef']['config']['extension']['dns']['enable']</tt></td>
    <td>Boolean</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
#### beef::default
Just include `beef` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef]"
  ]
}
```

#### Running tests

- First, install dependencies:  
`bundle install`

- Run Checkstyle and ChefSpec:  
`bundle exec rake`

- Run Kitchen tests:  
`bundle exec rake kitchen`  

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

