require 'spec_helper'

describe 'Страница статьи' do
  let!(:pub_article) { FactoryGirl.create(:pub_article) }

  before(:each) do
    visit article_path
    click_link(pub_article.short_title)
  end

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

  context 'содержит полный заголовок статьи' do
    it { should have_css('h1', text: pub_article.title) }
  end
end
