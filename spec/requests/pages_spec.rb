require 'spec_helper'

describe "Country page" do

  subject { page }

  before(:each) do
    visit country_path
  end
  it 'should be available'
  it 'should have title'
  it 'should have link to tours'
  it 'should have link to visas'
  it 'should subscribe to facebook'
  it 'should subscribe to google+'
  it 'should subscribe to vk'
  it 'should subscribe to twitter'
  it 'should be printed'

end
