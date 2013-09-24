require 'spec_helper'

describe 'Страница Визы'  do
  let!(:visa) { FactoryGirl.create(:visa) }

  subject { page }

  before do
    visit visas_path
    click_link(visa.title)
  end

  context 'имеет заголовок' do
    it { should have_css('h1', text: visa.title) }
  end
 # context 'имеет виджет Новости' do
 #   it { should have_css('h3', text: 'Новости компании') }
 # end
 # context 'имеет виджет Лучшая страна' do
 #   it { should have_css('h3', text: 'Страна месяца') }
 # end
end

