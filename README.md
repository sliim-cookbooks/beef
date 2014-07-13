beef Cookbook
=============
Install and configures beefproject - http://beefproject.com/
[![Cookbook Version](https://img.shields.io/cookbook/v/beef.svg)](https://community.opscode.com/cookbooks/beef) [![Build Status](https://secure.travis-ci.org/wargames-cookbooks/beef.png)](http://travis-ci.org/wargames-cookbooks/beef)

Requirements
------------
#### Cookbooks
- `apt` - `http://community.opscode.com/cookbooks/apt`
- `rbenv` - `https://github.com/RiotGames/rbenv-cookbook.git`

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian wheezy
- Ubuntu 12.04

Attributes
----------
#### beef::default
* `default["mu"]["ruby_version"]` - Rbenv ruby version to use
* `default["mu"]["user"]` - User to use for beefproject
* `default["mu"]["user_home"]` - User's home directory
* `default["mu"]["path"]` - Path where will be checkout beef repository

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

#### Tests
This cookbook use Strainer to define tests suites.

- First, install dependencies:  
`bundle install`  

- To run all tests:  
`bundle exec strainer test`

- To run integration tests:
`bundle exec kitchen test`

See `Strainerfile` for all tests suites.

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

