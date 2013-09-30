require 'spec_helper'

describe 'Страница туров' do

  subject { page }

  let(:tours) { Tour.published.first(10) }

  before do
    visit tours_path
  end

  it 'должна быть доступна' do
    status_code.should be 200
  end

  it 'должна отображать header' do
    should have_css('header')
  end

  it 'должна отображать поисковую форму' do
    should have_css('#search-bar')
  end

  it 'должна отображать заголовок "Каталог туров"' do
    should have_css('h2', text: 'Каталог туров')
  end

  it 'должна отображать туры' do
    tours.each do |x|
      should have_text(x.short_title)
    end
  end

  it 'должна отображать верное количество туров' do
    pending
  end

  it 'должна отображать виджет "Новости"' do
    should have_css('h4', 'Новости')
  end

  it 'должна отображать виджет "Страна месяца"' do
    should have_css('h2', 'Страна месяца')
  end

  it 'должна отображать виджет "Страны"' do
    should have_css('h2', 'Страны')
  end

  it 'должна отображать footer' do
    should have_css('#footer')

  end
end
