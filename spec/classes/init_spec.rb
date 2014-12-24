require 'spec_helper'
describe 'hiera_resources' do

  context 'with defaults for all parameters' do
    it { should contain_class('hiera_resources') }
  end
end
