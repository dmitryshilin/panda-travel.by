require 'spec_helper'

describe 'Страница виз' do
  let!(:visa) { FactoryGirl.create(:visa) }
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before do
    visit visas_path
  end

  context 'имеет заголовок' do
    it { should have_css('h1', text: 'Визы') }
  end

  context 'содержит список виз' do
    it { should have_content(visa.title) }
  end

  context 'имеет виджет Новости' do
   it { should have_css('h2', text: 'Новости компании') }
  end

  context 'имеет виджет Лучшая страна' do
   it { should have_css('h2', text: 'Страна месяца') }
  end
end

