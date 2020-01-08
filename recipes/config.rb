# Cookbook:: beef
# Recipe:: config
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

config_file = node['beef']['config_file']
config_file = node['beef']['path'] + '/config.yaml' if config_file.nil?
extensions_path = node['beef']['extensions_path']
extensions_path = node['beef']['path'] + '/extensions' if extensions_path.nil?
config = JSON.parse(node['beef']['config']['beef'].to_hash.dup.to_json)

template config_file do
  owner node['beef']['user']
  group node['beef']['group']
  source 'config.yaml.erb'
  variables config: { 'beef' => config }
  if node.recipe?('beef::service')
    notifies :restart, "service[#{node['beef']['service']['NAME']}]", :delayed
  end
end

node['beef']['config']['extensions'].keys.each do |key|
  config_file = "#{extensions_path}/#{key}/config.yaml" unless key == 'beef'
  config = JSON.parse(
    node['beef']['config']['extensions'][key].to_hash.dup.to_json
  )

  template config_file do
    owner node['beef']['user']
    group node['beef']['group']
    source 'config.yaml.erb'
    variables config:
                {
                  'beef' => {
                    'extension' => {
                      key => config,
                    },
                  },
                }
  end
end
