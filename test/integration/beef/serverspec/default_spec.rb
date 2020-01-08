require 'serverspec'
set :backend, :exec

describe user 'beef' do
  it { should exist }
  it { should belong_to_group 'beef' }
  it { should have_home_directory '/home/beef' }
end

describe group 'beef' do
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
