require 'spec_helper'

describe 'Страница Визы'  do
  it 'должен присутствовать header'
  it 'должно присутствовать меню'
  it 'должна присутствовать панель контактов'
  it 'должен присутствовать footer'
  it 'должен присутствовать заголовок' do
    pending
    should have_css('h1', text: 'Визы')
  end
  it 'должен присутствовать виджет новости'
  it 'должен присутствовать виджет лучшая страна'
  describe 'страница Виза' do
    it 'должен присутствовать header'
    it 'должно присутствовать меню'
    it 'должна присутствовать панель контактов'
    it 'должен присутствовать footer'
    it 'должна иметь описание'
    it 'должна иметь ссылки на страны'
    it 'должен присутствовать виджет лучшая страна'
    it 'должен присутствовать виджет новости'
  end
end
