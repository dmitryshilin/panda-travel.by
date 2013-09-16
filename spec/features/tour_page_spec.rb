require 'spec_helper'

describe 'Страница тура' do

  subject { page }

  before do
    visit tour_path
  end

  it 'должна отображать header'
  it 'должна отображать верный заголовок тура'
  it 'должна отображать картинку тура'
  it 'должна отображать программу тура'
  it 'должна отображать страны тура'
  it 'должна отображать верные даты выездов'
  it 'доллжна отображать ссылку "Визовые документы"'
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
  it 'должна отображать виджет "Страны"'
  it 'должна отображать footer'
end
