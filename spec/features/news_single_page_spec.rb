require 'spec_helper'

describe 'Страница новости' do
  let!(:pub_news) { FactoryGirl.create(:pub_news) }
  let!(:unpub_news) { FactoryGirl.create(:unpub_news) }

  subject { page }

  before do
    visit news_index_path
    click_link(pub_news.short_title)
  end

  context 'отображает заголовок новости' do
    it { should have_css('h1', text: pub_news.title) }
  end
  context 'отображает содержание опубликованной новости' do
    it { should have_content(pub_news.content) }
  end

  context 'не отображает содержание неопубликованной новости' do
    it { should have_no_content(unpub_news.content) }
  end
end
