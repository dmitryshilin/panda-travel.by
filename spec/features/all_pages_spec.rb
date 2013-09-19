require 'spec_helper'

describe 'На всех страницах' do
  subject { page }
  before { visit root_path }
  it 'should have good Header' do
    should have_css('#navb')
    within('#navb') do
      should have_css('#logo')
      should have_css('#currency')
    end
  end

  it 'Главное меню' do
    within('#mainmenu') do
      should have_link('Каталог туров', href: tours_path)
      should have_link('Визы', href: visas_path)
      should have_link('Путеводитель', href: articles_path)
      should have_link('Контакты', href: contacts_path)
    end
  end

  # let(:resttype) { FactoryGirl.create_list(:resttype) }
  it 'footer' do
    within('#footer') do
      should have_text('Приезжайте, звоните, пишите')
      # it 'должен содержать адрес'
      # it 'должен содержать телефоны'
      # it 'должен содержать другие контакты'
      should have_css('#logo')
      # it 'должен иметь строку с реквизитами'
      should have_link('Каталог туров', href: tours_path)
      should have_link('Визы', href: visas_path)
      should have_link('Путеводитель', href: articles_path)
      should have_link('Контакты', href: contacts_path)
      should have_text('солнце')
    end
  end

  describe 'Панель контакты' do
    it 'должна содержать адрес'
    it 'должна содержать описание'
    it 'должна иметь телефоны'
    it 'должна отображать facebook'
    it 'должна отображать vkontact'
    it 'должна отображать twitter'
  end

  describe 'Страны' do
    it 'должны быть ссылки одноименные странам'
  end
end
