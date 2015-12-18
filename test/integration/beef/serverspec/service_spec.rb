# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec

describe file '/etc/init.d/beef-test' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe file '/etc/default/beef-test' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end
