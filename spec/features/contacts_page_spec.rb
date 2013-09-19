require 'spec_helper'

describe 'Страница контактов' do

  subject { page }

  before do
    visit contacts_path
  end

  it 'должна отображать header'
  it 'должна отображать заголовок "Контактная информация"'
  it 'должна отображать верные контактные данные'
  it 'должна отображать карту'
  it 'отображает кнопку facebook'
  it 'отображает кнопку google plus'
  it 'отображает кнопку twitter'
  it 'отображает кнопку vkontakte'
  it 'должна иметь ссылку "Распечатать страницу"'
  it 'должна отображать виджет "Новые туры"'
  it 'должна отображать виджет "Страны"'
  it 'должна отображать footer'
end
