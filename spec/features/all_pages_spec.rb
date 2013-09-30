require 'spec_helper'

describe 'На всех страницах' do
  subject { page }
  before { visit root_path }

  it 'sдолжна быть доступна' do
    status_code.should be 200
  end

  it 'should have good Header' do
    should have_css('#navb')
    within('#navb') do
      should have_css('#logo')
      should have_css('#currency')
      should have_css('#weather')
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
  let (:resttype) { RestType.all }
  it 'footer' do
    within('#footer') do
      should have_text('Приезжайте, звоните, пишите')
      should have_text('Независимости, 28, офис 2')
      should have_text('+375 (17) 327 83 68')
      should have_text('+375 (29) 327 03 02')
      should have_text('+375 (29) 220 23 43')
      should have_link('hello@panda-travel.by', href: 'mailto:hello@panda-travel.by')
      should have_link('panda-travel', href: 'skype:panda-travel?call')
      should have_css('#logo')
      should have_text('ЧТУП "Панда Трэвел" УНП 191675650')
      should have_link('Каталог туров', href: tours_path)
      should have_link('Визы', href: visas_path)
      should have_link('Путеводитель', href: articles_path)
      should have_link('Контакты', href: contacts_path)
      resttype.each do |x|
        should have_link(x.title, href: resttypes_path(x))
      end
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

  let(:countries) { Country.all }
  it 'Страны' do
    within('#countries-part') do
      countries.each do |country|
        should have_link(country.title, href: country_path(country))
      end
    end
  end
end
