require_relative 'spec_helper'

describe 'beef::geoip_database' do
  let(:subject) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache'
    ) do |node|
      node.normal['beef']['geoip_url'] = 'https://host/geoip.tar.gz'
      node.normal['beef']['config']['beef']['geoip']['database'] = '/opt/geoip/geoip.mmdb'
    end.converge(described_recipe)
  end

  it 'creates directory[/opt/geoip]' do
    expect(subject).to create_directory('/opt/geoip')
  end

  it 'creates remote_file[/var/chef/cache/geoip.tar.gz]' do
    expect(subject).to create_remote_file('/var/chef/cache/geoip.tar.gz')
  end
end
