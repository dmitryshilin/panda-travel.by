require 'spec_helper'

describe 'Страница всех статей' do
  before(:each) do
    #visit articles_path
  end
  it 'должна быть доступна'
  it 'должна иметь верный заголовок'
  it 'должна иметь верное колличество статей'
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
