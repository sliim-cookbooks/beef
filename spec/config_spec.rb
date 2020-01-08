require_relative 'spec_helper'

describe 'beef::config' do
  context 'when installed from sources' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.normal['beef']['user'] = 'beefuser'
        node.normal['beef']['path'] = '/opt/beef-home'
      end.converge(described_recipe)
    end

    it 'creates template[/opt/beef-home/config.yaml]' do
      expect(subject).to create_template('/opt/beef-home/config.yaml')
        .with(owner: 'beefuser',
              source: 'config.yaml.erb')
    end
  end

  context 'when config file specified' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.normal['beef']['config_file'] = '/etc/beef-xss/config.yaml'
      end.converge(described_recipe)
    end

    it 'creates template[/etc/beef-xss/config.yaml]' do
      expect(subject).to create_template('/etc/beef-xss/config.yaml')
        .with(owner: 'root',
              source: 'config.yaml.erb')
    end
  end

  context 'with extension' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.normal['beef']['config']['extensions']['metasploit']['enable'] = true
      end.converge(described_recipe)
    end

    it 'creates template[/opt/beef/config.yaml]' do
      expect(subject).to create_template('/opt/beef/config.yaml')
        .with(owner: 'root',
              source: 'config.yaml.erb')
    end

    ext_file = '/opt/beef/extensions/metasploit/config.yaml'
    it "creates template[#{ext_file}]" do
      expect(subject).to create_template(ext_file)
        .with(owner: 'root',
              source: 'config.yaml.erb')
    end
  end
end
