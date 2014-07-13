# encoding: utf-8
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

require 'spec_helper'

describe file '/home/beef/beefproject' do
  it { should be_directory }
  it { should be_owned_by 'beef' }
end

describe file '/home/beef/.rbenv/versions/1.9.3-p547' do
  it { should be_directory }
end

describe file '/home/beef/.rbenv/version' do
  it { should be_file }
  its(:content) { should match(/^1.9.3-p547$/) }
end

describe file '/etc/profile.d/rbenv.sh' do
  it { should be_file }
end

describe port 2000 do
  it { should be_listening }
end

describe port 3000 do
  it { should be_listening }
end
