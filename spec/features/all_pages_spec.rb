require 'spec_helper'

describe 'На всех страницах' do
  subject { page }
  # before { visit root_path }
  describe 'заголовок' do
    it 'должен иметь лого'
    it 'должен иметь курс валюты'
  end

  describe 'Главное меню' do
    it 'должно иметь ссылку Каталог туров' do
      pending
      should have_link('Каталог туров', href: tours_path)
    end
    it 'должно иметь ссылку Визы' do
      pending
      should have_link('Визы', href: visas_path)
    end

    it 'должно иметь ссылку Путеводитель' do
      pending
      should have_link('Путеводитель', href: some_odd_name_path)
    end

    it 'должно иметь ссылку Контакты' do
      pending
      should have_link('Контакты', href: contacts_path)
    end
  end

  describe 'футер' do
    it 'должен иметь приглашение'
    it 'должен содержать адрес'
    it 'должен содержать телефоны'
    it 'должен содержать другие контакты'
    it 'должен иметь лого'
    it 'должен иметь строку с реквизитами'
    it 'должен иметь ссылки' do
      pending
      should have_link('Каталог туров', href: tours_path)
      should have_link('Визы', href: visas_path)
      should have_link('Путеводитель', href: some_odd_name_path)
      should have_link('Контакты', href: contacts_path)
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
