require_relative 'spec_helper'

describe 'beef::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'includes recipe[beef::install_src]' do
    expect(subject).to include_recipe('beef::install_src')
  end

  it 'includes recipe[beef::config]' do
    expect(subject).to include_recipe('beef::config')
  end
end
