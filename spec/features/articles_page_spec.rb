require 'spec_helper'

describe 'Страница всех статей' do
  let!(:pub_article) { FactoryGirl.create(:pub_article) }
  let!(:unpub_article) { FactoryGirl.create(:unpub_article) }
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before(:each) do
    visit articles_path
  end

  context 'отображает заголовок "Путешествия"' do
    it { should have_css('h1', text: 'Путешествия') }
  end

  context 'отображает короткие заголовки опубликованных статей' do
    it { should have_content(pub_article.short_title) }
  end

  context 'не отображает короткие заголовки неопубликованных статей' do
    it { should have_no_content(unpub_article.short_title) }
  end

  context 'отображает виджет Новости' do
    it { should have_css('h2', text: 'Новости компании') }
  end

  context 'отображает виджет Лучшая страна' do
    it { should have_css('h2', text: 'Страна месяца') }
  end

  context 'отображает ссылку "Распечатать страницу"' do
    it { should have_link('Распечатать страницу', href: '#') }
  end
end
