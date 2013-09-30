require 'spec_helper'

describe 'Страница визы'  do
  let!(:visa) { FactoryGirl.create(:visa) }
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before do
    visit visas_path
    click_link(visa.title)
  end

  context 'имеет заголовок' do
    it { should have_css('h1', text: visa.title) }
  end

  context 'содержит описание визы' do
    it { should have_content(visa.description) }
  end

  context 'имеет виджет Новости' do
    it { should have_css('h2', text: 'Новости компании') }
  end

  context 'имеет виджет Лучшая страна' do
    it { should have_css('h2', text: 'Страна месяца') }
  end
end
