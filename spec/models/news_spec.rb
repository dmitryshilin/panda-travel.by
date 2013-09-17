require 'spec_helper'

describe News do
  let!(:published_news) { FactoryGirl.create_list(:published_news, 5) }
  let!(:unpublished_news) { FactoryGirl.create_list(:unpublished_news, 4) }
  let(:published) { News.published }
  let(:one_news) { FactoryGirl.build(:news) }


  describe 'структура' do
    it 'должна содержать поле title' do
       one_news.title.should be
    end
    it 'должна содержать поле short_title' do
      one_news.short_title.should be
    end
    it 'должна содержать поле content' do
      one_news.content.should be
    end
    it 'должна содержать поле published' do
      one_news.published.should be
    end
  end


  describe 'сохранение новости в БД' do
    it 'должен быть валидным' do
      if one_news.respond_to?(:valid?)
        expect(one_news).to be_valid, one_news.errors.full_messages.join(',')
      end
    end
    it 'при успешном сохранении статьи должен возвращаться объект типа News' do
      News.all.should_not be_empty
    end
  end

  describe 'удаление из БД по заданному ID' do
    it 'при успешном удалении должно возвращаться значение TRUE' do
      News.last.destroy.should be_true
    end

    it 'удаленный объект не должен существовать' do
      News.last.destroy
      News.exists?(9).should be_false
    end
  end

  describe 'поиск новостей в БД' do
    it 'должно возвращать только опубликованные новости' do
      published.should_not be_empty
      published.each do |news|
        news.should be_published
      end
    end
    it 'колличество новостей должно быть равно 9' do
      News.count.should  eq(9)
    end
    it 'для существующего ID должен возвращаться объект News' do
      News.find_by_id(8).should be
    end

    it 'для несуществующего ID должен возвращать nil' do
      News.find_by_id(100).should eq(nil)
    end
  end

end