require 'spec_helper'

describe 'Страница контактов' do

  subject { page }

  before do
    visit contacts_path
  end

  it 'должна отображать заголовок "Контактная информация"'
  it 'должна отображать верные контактные данные'
  it 'должна отображать карту'
  it 'должна отображать виджет "Новые туры"'
  context 'должна отображать кнопки социальной сетей' do
    it 'facebook'
    it 'google plus'
    it 'twitter'
    it 'vkontakte'
  end
end
