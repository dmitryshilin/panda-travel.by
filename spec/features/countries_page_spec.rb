require 'spec_helper'

describe 'Страница стран' do
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before do
    visit countries_path
  end

  it 'отображает header'
  context 'отображает заголовок "Страны"' do
    it { should have_css('h1', text: "Страны") }
  end
  context 'отображает ссылку на страну' do
    it { should have_link(country.title)}
  end
  it 'отображает footer'
end
