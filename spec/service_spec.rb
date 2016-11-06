# -*- coding: utf-8 -*-

require 'chefspec'

describe 'beef::service' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.2') do |node|
      node.set['beef']['path'] = '/opt/beef-test'
      node.set['beef']['service']['NAME'] = 'beef-test'
      node.set['beef']['service']['USER'] = 'beef-dev'
    end.converge(described_recipe)
  end

  it 'includes recipe[beef]' do
    expect(subject).to include_recipe('beef')
  end

  it 'creates template[/etc/init.d/beef-test]' do
    expect(subject).to create_template('/etc/init.d/beef-test')
      .with(source: 'service/init.erb',
            owner: 'root',
            group: 'root',
            mode: '0755')
  end

  it 'creates template[/etc/default/beef-test]' do
    expect(subject).to create_template('/etc/default/beef-test')
      .with(source: 'service/default.erb',
            owner: 'root',
            group: 'root',
            mode: '0644')
    [/^USER="beef-dev"$/,
     /^NAME="beef-test"/].each do |m|
      expect(subject).to render_file('/etc/default/beef-test')
        .with_content(m)
    end
  end

  it 'enables service[beef-test]' do
    expect(subject).to enable_service('beef-test')
  end

  it 'starts service[beef-test]' do
    expect(subject).to start_service('beef-test')
  end
end
