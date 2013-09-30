require 'spec_helper'

describe 'Домашняя страница' do
  subject { page }
  before { visit root_path }

    it 'должна быть доступна' do
      status_code.should be 200
    end

    it 'должен присутствовать header' do
      should have_css('header')
    end

    it 'должно присутствовать меню' do
      should have_css('#main-menu')
    end

    it 'должна присутствовать панель контактов' do
      should have_css('#adress-bar')
    end

    it 'должен присутствовать footer' do
      should have_css('#footer')
    end

    it 'должен присутствовать виджет лучшая страна' do
      should have_css('#best-country')
    end

    it 'должна присутствовать поисковая форма'

    describe 'Хиты продаж' do
      it 'должны иметь правильный заголовок' do
        should have_css('h2', text: 'Хиты продаж')
      end

      it 'должен быть виджет ближайший тур' do
        should have_text('Ближайший автобусный тур')
      end

      let(:hits_of_sales) { Tour.hits }
      it 'должна присутствовать пачка туров' do
        expect(hits_of_sales.count).to eq(6)
      end

      describe 'Каждый виджет тура' do
        it 'дожен иметь цену'
        it 'дожен иметь правильную картинку'
        it 'должен иметь заголовок'
        it 'должен иметь описание'
      end
    end

    describe 'Мы лучшие' do
      it 'должен быть заголовок' do
        should have_css('h2', text: 'Мы предлагаем только лучший отдых')
      end

      it 'должна присутствовать ссылка на все туры' do
        should have_link('база туров')
      end

      it 'должна присутствовать ссылка автобусные туры' do
        should have_link('Автобусные туры')
      end

      it 'должна присутствовать ссылка отдых на море' do
        should have_link('отдых на море')
      end

      it 'должна присутствовать ссылка авиатуры' do
        should have_link('авиатуры')
      end

      it 'должна присутствовать ссылка туры выходного дня' do
        should have_link('туры выходного дня')
      end

      describe 'должен присутствовать виджет новости' do
        it 'должна присутствовать ссылка' do
          should have_link('Все новости', href: news_index_path)
        end
      end
    end

    describe 'Раздел путешествия' do
      it 'должен иметь правильный заголовок' do
        should have_css('h2', text: 'Путешествия')
      end

      it 'должен быть виджет страна месяца' do
        within('#articles-part') do
          should have_text('Страна месяца')
        end
      end

      it 'должна присутствовать пачка статей'
      describe 'Каждый виджет статья' do
        it 'дожен иметь правильную картинку'
        it 'должен иметь заголовок'
        it 'должен иметь описание'
      end
    end
end
