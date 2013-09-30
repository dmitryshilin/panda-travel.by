require 'spec_helper'

describe 'Страница статьи' do

  # before(:each) do
  #   visit article_path
  # end

  # it 'должна быть доступна'
  # it 'должна иметь верный заголовок'
  # it 'можно опубликовать в facebook'
  # it 'можно опубликовать в google+'
  # it 'можно опубликовать в vk'
  # it 'можно опубликовать в twitter'
  # it 'должна иметь ссылку "Распечатать страницу"'
  # it 'должен содержать header'
  # it 'должен содержать footer'
  # it 'должны присутствовать "Новости компании"'
  # it 'должна присутствовать "Страна месяца"'
  # it 'должны присутствовать "Страны"'

  let!(:pub_article) { FactoryGirl.create(:pub_article) }
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before(:each) do
    visit articles_path
    click_link(pub_article.short_title)
  end

  context 'содержит полный заголовок статьи' do
    it { should have_css('h1', text: pub_article.title) }
  end

  context 'отображает содержание статьи' do
    it { should have_content(pub_article.content) }
  end

  context 'отображает виджет Новости' do
    it { should have_css('h2', text: 'Новости компании') }
  end

  context 'отображает виджет Лучшая страна' do
    it { should have_css('h2', text: 'Страна месяца') }
  end
end

