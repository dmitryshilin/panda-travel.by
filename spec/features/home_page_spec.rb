require 'spec_helper'

describe 'Домашняя страница' do
  subject { page }
  before { visit root_path }

    it 'должна быть доступна' do
      pending
      response_code should be 200
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
        pending
      end
      it 'должна присутствовать пачка туров'
      describe 'Каждый виджет тура' do
        it 'дожен иметь цену'
        it 'дожен иметь правильную картинку'
        it 'должен иметь заголовок'
        it 'должен иметь описание'
      end
    end

    describe 'Мы лучшие' do
      it 'должен присутствовать'
      it 'должен быть заголовок' do
        pending
        should have_css('h1', text: 'Мы предлагаем только лучший отдых')
      end

      it 'должна присутствовать ссылка на все туры' do
        pending
        should have_link('база туров', href: tours_path)
      end

      it 'должна присутствовать ссылка автобусные туры' do
        pending
        should have_link('Автобусные туры', href: '#')
      end

      it 'должна присутствовать ссылка отдых на море' do
        pending
        should have_link('отдых на море', href: '#')
      end

      it 'должна присутствовать ссылка авиатуры' do
        pending
        should have_link('авиатуры', href: '#')
      end

      it 'должна присутствовать ссылка туры выходного дня' do
        pending
        should have_link('туры выходного дня', href: '#')
      end

      it 'должен присутствовать виджет новости' do
        # within('company-news') do
          # describe 'News' do
        pending
        it 'должны быть 3 последних новости'
        it 'должна присутствовать ссылка' do
          pending
          it { should have_link('Все новости', href: news_path) }
        end
          # end
        # end
      end
    end

    describe 'Раздел путешествия' do
      it 'должен присутствовать'
      it 'должен иметь правильный заголовок' do
        pending
        should have_css('h1', text: 'Путешествия')
      end
      it 'должен быть виджет страна месяца'
      it 'должна присутствовать пачка статей'
      describe 'Каждый виджет статья' do
        it 'дожен иметь правильную картинку'
        it 'должен иметь заголовок'
        it 'должен иметь описание'
      end
    end
end
