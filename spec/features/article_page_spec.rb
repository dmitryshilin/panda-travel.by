require 'spec_helper'

describe 'Страница статьи' do
  before(:each) do
    #visit article_path
  end
  it 'должна быть доступна'
  it 'должна иметь верный заголовок'
  it 'можно опубликовать в facebook'
  it 'можно опубликовать в google+'
  it 'можно опубликовать в vk'
  it 'можно опубликовать в twitter'
  it 'должна иметь ссылку "Распечатать страницу"'
  it 'должен содержать header'
  it 'должен содержать footer'
  describe 'Новости компании' do
    it 'должны присутствовать'
    it 'должны иметь правильный заголовок' do
      pending
      should have_css('h2', text: 'Новости компании')
    end
  end
  describe 'Страна месяца' do
    it 'должна присутствовать'
    it 'должна иметь правильный заголовок' do
      pending
      should have_css('h2', text: 'Страна месяца')
    end
  end
  describe 'виджет Страны' do
    it 'должен присутствовать'
    it 'должен иметь правильный заголовок' do
      pending
      should have_css('h2', text: 'Страны')
    end
    it 'должен содержать страны'
  end
end
