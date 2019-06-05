BeEF Cookbook
=============
Install and configures [BeFF](http://beefproject.com) - The Browser Exploitation Framework!

[![Cookbook Version](https://img.shields.io/cookbook/v/beef.svg)](https://community.opscode.com/cookbooks/beef) [![Build Status](https://secure.travis-ci.org/sliim-cookbooks/beef.png)](http://travis-ci.org/sliim-cookbooks/beef)

Requirements
------------
#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian wheezy
- Debian jessie

Attributes
----------
#### Install from package
|               Key         |  Type  |                 Description                                           |
| ------------------------- | ------ | --------------------------------------------------------------------- |
| `[beef][install_package]` | Array  | Package to install when installing from package (default: `beef-xss`) |

#### Install from sources
| Key                      | Type   | Description                                                                                                     |
| ------------------------ | ------ | --------------------------------------------------------------------------------------------------------------- |
| `[beef][packages]`       | Array  | Additional packages to install when installing from sources (default: `[git, libsqlite3-dev, build-essential]`) |
| `[beef][gem_packages]`   | Array  | Additional gem packages to install when installing from sources (default: `[bundler]`)                          |
| `[beef][user]`           | String | BeEF user (default: `root`)                                                                                     |
| `[beef][group]`          | String | BeEF group (default: `root`)                                                                                    |
| `[beef][path]`           | String | BeEF installation path (default: `/opt/beef`)                                                                   |
| `[beef][git_repository]` | String | BeEF repository url (default: `https://github.com/beefproject/beef.git`)                                        |
| `[beef][git_reference]`  | String | BeEF repository reference (default: `beef-0.4.7.0`)                                                             |
| `[beef][ruby_bin_dir]`   | String | Ruby bin directory (default: `/opt/chef/embedded/bin`)                                                          |

#### Configuration
- `[beef][config_file]` Path to configuration file. The `beef::install_pkg` automatically set this to `/etc/beef-xss/config.yaml`. If `nil` automatically generated from `[beef][path]` attribute. Default: `nil`.
- `[beef][extensions_path]` Path to BeEF extensions. The `beef::install_pkg` automatically set this to `/usr/share/beef-xss/extensions`. If `nil` automatically generated from `[beef][path]` attribute. Default: `nil`.
- The `[beef][config][beef]` namespace is a Hash containing the BeEF configuration. Extensions configuration are defined in `[beef][config][extensions]`

Default configuration is set from [beef-0.4.7.0](https://github.com/beefproject/beef/blob/beef-0.4.7.0/config.yaml)

#### Service
Use the `[beef][service]` attribute to override variables service configuration. See [default](attributes/default.rb) attributes.

All variables you can override can be found in [service template](templates/default/service/init.erb#L13-L20).

#### GeoIP database
| Key                 | Type   | Description                                                                                                               |
| ------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------- |
| `[beef][geoip_url]` | String | URL to fetch GEOIP database archive (default: `https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz`) |

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

#### beef::install_pkg
Just include `beef::install_pkg` in your node's `run_list` to install BeEF from package:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef::install_pkg]"
  ]
}
```

#### beef::install_src
Just include `beef::install_src` in your node's `run_list` to install BeEF from sources:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef::install_src]"
  ],
  "attributes": {
    "beef": {
      "user": "beef",
      "group": "beef",
      "path": "/opt/beef"
    }
  }
}
```

#### beef::config
Just include `beef::install_src` in your node's `run_list` to configure BeEF.
You can optionally set the configuration file target with `[beef][config_file]` attribute:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef::config]"
  ],
  "attributes": {
    "beef": {
      "config_file": "/etc/beef/config.yaml"
    }
  }
}
```

#### beef::service
Just include `beef::service` in your node's `run_list` to setup BeEF service:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef::service]"
  ],
  "attributes": {
    "beef": {
      "service": {
        "NAME": "beef-xss"
      }
    }
  }
}
```

#### beef::geoip_database
Just include `beef::geoip_database` in your node's `run_list` to download GeoIP database:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[beef::geoip_database]"
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

