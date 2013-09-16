require 'spec_helper'

describe 'Страница статьи'   do
  before(:each) do
    visit article_path
  end
  it 'должна быть доступна'
  it 'должна иметь верный заголовок'
  it 'можно опубликовать в facebook'
  it 'можно опубликовать в google+'
  it 'можно опубликовать в vk'
  it 'можно опубликовать в twitter'
  it 'должна иметь ссылку "Распечатать страницу"'
end