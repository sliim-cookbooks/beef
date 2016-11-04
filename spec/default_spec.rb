# -*- coding: utf-8 -*-

require 'chefspec'

describe 'beef::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new(
      platform: 'debian',
      version: '8.2'
    ).converge(described_recipe)
  end

  it 'includes recipe[beef::install_src]' do
    expect(subject).to include_recipe('beef::install_src')
  end

  it 'includes recipe[beef::config]' do
    expect(subject).to include_recipe('beef::config')
  end
end
