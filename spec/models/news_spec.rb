require 'spec_helper'

describe News do
  let!(:published_news) { FactoryGirl.create_list(:news, 5, :published) }
  let!(:unpublished_news) { FactoryGirl.create_list(:news, 3, :unpublished) }
  it 'не может быть пустое' do
    published_news = News.all.select { |news| news.published? }
    published_news.should_not be_empty
  end
  it 'колличество новостей должно быть равно 5' do
    published_news.count.should be 5
  end
end