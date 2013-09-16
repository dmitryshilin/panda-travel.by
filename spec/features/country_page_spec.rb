require 'spec_helper'

describe 'Страница страны' do

  subject { page }

  before(:each) do
    # visit country_path
  end
  it 'должна быть доступна'
  it 'должна иметь верный заголовок'
  it 'должна иметь ссылку на туры'
  it 'должна иметь ссылку на визы'
  it 'можно опубликовать в facebook'
  it 'можно опубликовать в google+'
  it 'можно опубликовать в vk'
  it 'можно опубликовать в twitter'
  it 'должна иметь ссылку "Распечатать страницу"'
  it 'должен содержать header'
  it 'должен содержать footer'
  it 'должны присутствовать "Новости компании"'
  it 'должна присутствовать "Страна месяца"'
  it 'должны присутствовать "Страны"'
  describe 'Смотрите также' do
    it 'должен присутствовать'
    it 'должен иметь правильный заголовок' do
      pending
      should have_css('h2', text: 'Смотрите также')
    end
    it 'должен содержать туры'
  end
end
