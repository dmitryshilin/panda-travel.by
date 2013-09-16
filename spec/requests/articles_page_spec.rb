require 'spec_helper'

describe 'Страница всех статей' do
  before(:each) do
    visit articles_path
  end
  it 'должна быть доступна'
  it 'должна иметь верный заголовок'
  it 'должна иметь верное колличество статей'
  it 'должна иметь ссылку "Распечатать страницу"'
end
