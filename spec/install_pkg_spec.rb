# -*- coding: utf-8 -*-

require 'chefspec'

describe 'beef::install_pkg' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.set['beef']['install_package'] = 'beef'
    end.converge(described_recipe)
  end

  it 'installs package[beef]' do
    expect(subject).to install_package('beef')
  end
end
