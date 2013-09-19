require 'spec_helper'

describe 'Страница страны' do
  let!(:country) { FactoryGirl.create(:country) }

  subject { page }

  before(:each) do
    visit countries_path
    click_link(country.title)
  end

  context 'имеет заголовок страны' do
    it { should have_css('h1', text: country.title) }
  end
  it 'имеет ссылку на туры страны'
  it 'имеет ссылку на визы страны'
  it 'имеет ссылку "Распечатать страницу"'
  it 'содержит header'
  it 'содержит footer'
  it 'имеет виджет "Новости компании"'
  it 'имеет виджет "Страна месяца"'
  it 'имеет виджет "Страны"'
  context 'имеет виджет "Смотрите также"' do
    it { should have_css('h2', text: 'Смотрите также') }
  end
  it 'отображает кнопку facebook'
  it 'отображает кнопку google plus'
  it 'отображает кнопку twitter'
  it 'отображает кнопку vkontakte'
end
