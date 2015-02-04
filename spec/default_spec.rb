# -*- coding: utf-8 -*-

require 'rspec/expectations'
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

    it 'does install packages' do
      expect(subject).to install_package('git')
      expect(subject).to install_package('ruby')
    end

    it 'does install bundler gem package' do
      expect(subject).to install_gem_package('bundler')
    end

    it 'does create beef user' do
      expect(subject).to create_user('beefuser')
        .with(system: true,
              home: '/opt/beef-home')
    end

    it 'does clone the beefproject repository' do
      expect(subject).to sync_git('/opt/beef-home')
        .with(repository: 'http://git.server.org/beef.git',
              reference: 'stable')
    end

    it 'does chown beef directory after cloning' do
      resource = subject.git('/opt/beef-home')
      expect(resource).to notify('execute[chown-beef-dir]').to(:run).immediately
    end

    it 'does create config file' do
      expect(subject).to create_template('/opt/beef-home/config.yaml')
        .with(owner: 'beefuser',
              group: 'beefuser',
              source: 'config.yaml.erb')

      # TODO: Matches with attributes
    end

    it 'does run bundle install' do
      expect(subject).to run_execute('bundle install')
        .with(cwd: '/opt/beef-home',
              user: 'root')
    end

    it 'does run beef process' do
      expect(subject).to run_execute(
        'nohup ruby beef >> beef.log 2>> beef.err &')
        .with(cwd: '/opt/beef-home',
              user: 'beefuser',
              group: 'beefuser')
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

    it 'does not create root user' do
      expect(subject).to_not create_user('root')
        .with(system: true,
              home: '/opt/beef-home')
    end
  end
end
