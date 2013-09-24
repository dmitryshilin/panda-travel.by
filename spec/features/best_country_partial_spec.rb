require 'spec_helper'

describe 'Partial лучшая страна' do
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before(:each) do
    visit root_path
  end

  context 'имеет заголовок' do
    it { should have_css('h3', text: 'Страна месяца') }
  end

  context 'имеет заголовок страны' do
    it { should have_css('h2', text: country.title) }
  end
end

