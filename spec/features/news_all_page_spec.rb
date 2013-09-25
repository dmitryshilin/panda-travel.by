require 'spec_helper'

describe 'Страница новостей' do
  let!(:pub_news) { FactoryGirl.create(:pub_news) }
  let!(:unpub_news) { FactoryGirl.create(:unpub_news) }

  subject { page }

  before do
    visit news_index_path
  end

  context 'отображает заголовок "Новости компании"' do
    it { should have_css('h1', text: 'Новости компании') }
  end

  context 'отображает заголовок опубликованной новости' do
    it { should have_content(pub_news.short_title) }
  end

  context 'не отображает заголовок неопубликованной новости' do
    it { should have_no_content(unpub_news.short_title) }
  end

  context 'имеет ссылку на новость' do
    it { should have_link(pub_news.short_title) }
  end
end
