require 'spec_helper'

describe 'Страница страны' do

  subject { page }

  before(:each) do
    visit country_path
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
end
