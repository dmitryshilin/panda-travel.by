require 'spec_helper'

describe 'Страница тура' do

  subject { page }

  let(:tour) { Tour.published.first }

  before { visit tour_path(tour) }

  it 'должна быть доступна' do
    status_code.should be 200
  end

  it 'должна отображать верный заголовок тура' do
    should have_css('h2', text: tour.short_title)
  end

  it 'должна отображать картинку тура' do
    pending
  end

  it 'должна отображать программу тура' do
    tour.steps.each do |step|
      should have_text(step.number)
      should have_text(step.description)
    end
  end

  it 'должна отображать страны тура' do
    tour.countries.each do |country|
      should have_link(country.title, country_path(country))
    end
  end

  it 'должна отображать верные даты выездов' do

    within('#vidjet-dates-of') do
      tour.dates_of.each do |date|
        should have_text(date)
      end
    end
  end

  it 'доллжна отображать ссылку "Визовые документы"' do
    tour.attaches.each do |attach|
      should have_link(attach.title, attach.url)
    end
  end
  it 'должна иметь ссылку "Маршрут на карте"'
  it 'должна иметь ссылку "Скачать программу тура"'
  it 'должна иметь ссылку "Распечатать страницу"'
  it 'должна отображать базовую стоимость тура'
  it 'должна отображать специальную стоимость тура'
  it 'должна иметь кнопку "Заказать тур"'
  it 'должна иметь Примечания'
  it 'должна отображать Менеджера тура'
  it 'должна отображать "Вы смотрели:"'
  it 'должна отображать таблицу графика заездов'
  context 'должна отображать кнопки социальной сетей' do
    it 'facebook'
    it 'google plus'
    it 'twitter'
    it 'vkontakte'
  end

  it 'должна отображать виджет "Смотрите также"'
end
