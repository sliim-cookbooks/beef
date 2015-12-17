# -*- coding: utf-8 -*-

require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'beef' }

require 'chef/application'

describe 'beef::default' do
  context 'with custom user' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.set['beef']['packages'] = %w(git ruby)
        node.set['beef']['user'] = 'beefuser'
        node.set['beef']['path'] = '/opt/beef-home'
        node.set['beef']['git_repository'] = 'http://git.server.org/beef.git'
        node.set['beef']['git_reference'] = 'stable'
      end.converge(described_recipe)
    end

    %w(git ruby).each do |pkg|
      it "installs package[#{pkg}]" do
        expect(subject).to install_package(pkg)
      end
    end

    it 'installs gem_package[bundler]' do
      expect(subject).to install_gem_package('bundler')
        .with(gem_binary: '/opt/chef/embedded/bin/gem')
    end

    it 'creates user[beefuser]' do
      expect(subject).to create_user('beefuser')
        .with(system: true,
              home: '/opt/beef-home')
    end

    it 'creates group[beefuser]' do
      expect(subject).to create_group('beefuser')
        .with(members: ['beefuser'])
    end

    it 'creates directory[/opt/beef-home]' do
      expect(subject).to create_directory('/opt/beef-home')
        .with(owner: 'beefuser',
              group: 'beefuser')
    end

    it 'syncs git[/opt/beef-home]' do
      expect(subject).to sync_git('/opt/beef-home')
        .with(repository: 'http://git.server.org/beef.git',
              reference: 'stable',
              user: 'beefuser')
    end

    it 'creates template[/opt/beef-home/config.yaml]' do
      expect(subject).to create_template('/opt/beef-home/config.yaml')
        .with(owner: 'beefuser',
              source: 'config.yaml.erb')
    end

    it 'runs execute[bundle install]' do
      expect(subject).to run_execute('bundle install')
        .with(cwd: '/opt/beef-home')
    end
  end

  context 'with root user' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.set['beef']['user'] = 'root'
        node.set['beef']['packages'] = []
        node.set['beef']['path'] = '/opt/beef-home'
      end.converge(described_recipe)
    end

    it 'does not create user[root]' do
      expect(subject).to_not create_user('root')
    end

    it 'does not create group[root]' do
      expect(subject).to_not create_group('root')
    end
  end
end
