# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec
set :path, '/opt/ndenv/shims/:/opt/ndenv/versions/v0.10.26/bin:$PATH'

describe user 'beef' do
  it { should exist }
end

describe file '/home/beef' do
  it { should be_directory }
  it { should be_owned_by 'beef' }
  it { should be_grouped_into 'beef' }
  it { should be_mode 755 }
end

describe file '/home/beef/config.yaml' do
  it { should be_file }
  it { should be_owned_by 'beef' }
  it { should be_grouped_into 'beef' }
  it { should be_mode 644 }
end

describe port 2000 do
  it { should be_listening }
end

describe port 3000 do
  it { should be_listening }
end
